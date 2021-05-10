// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';

Future<int> main(List<String> args) async {
  Options options;
  try {
    options = Options.read(args);
  } on EmptyOptionsException {
    return 0;
  } on OptionsException catch (e) {
    print(e.text);
    return 1;
  }

  Map<String, List<String>> map;
  try {
    map = findAndReadStatusFiles(options.sdk);
  } on StatusFilesException catch (e) {
    print(e.text);
    return -1;
  }
  List<String> arguments = [
    'log',
    '--pretty=format:"%h"',
    '--after=${options.after}',
    if (options.before != null) '--before=${options.before}'
  ];
  ProcessResult res = await Process.run('git', arguments);
  if (res.exitCode != 0) {
    print(res.stderr);
    return 2;
  }
  int foundCount = 0;
  List<String> commits = (res.stdout as String).split("\n");
  for (var c in commits) {
    if (c.isEmpty) {
      continue;
    }
    c = c.replaceAll('"', '');
    ProcessResult r = await Process.run(
        'git', ['show', '--pretty=format:""', '--name-only', c]);
    if (r.exitCode != 0) {
      print(r.stderr);
      return 3;
    }
    List files = (r.stdout as String).split("\n");
    for (String f in files) {
      if (f.isEmpty) {
        continue;
      }
      if (f.endsWith(".dart")) {
        String testName = f.substring(0, f.indexOf(".dart"));
        var found = map[testName];
        if (found != null) {
          print(
              "Test $testName was changed in commit $c and presents in the following status files");
          print(found);
          foundCount++;
        }
      }
    }
  }
  print("$foundCount status files entries was found in ${commits.length} commits");
  return 0;
}

class Options {
  String? after = null;
  String? before = null;
  String sdk = '.';
  int days = 30;

  static Options read(List<String> args) {
    Options options = new Options();
    if (args.length > 0) {
      for (var arg in args) {
        if (!_checkFormat(arg)) {
          throw OptionsException("Unknown argument: '$arg'");
        }
        List<String> pair = arg.substring(1).split("=");
        switch (pair[0]) {
          case "after":
            options.after = pair[1];
            break;
          case "before":
            options.before = pair[1];
            break;
          case "days":
            try {
              options.days = int.parse(pair[1]);
            } on FormatException catch (_) {
              throw new OptionsException(
                  "Unable to parse 'days' value: '${pair[0]}'");
            }
            DateTime da = DateTime.now().add(Duration(days: -options.days));
            options.after = _formatDate(da);
            break;
          case "sdk":
            options.sdk = pair[1];
            break;
          default:
            throw new OptionsException("Unknown argument: '${pair[0]}'");
        }
      }
      if (options.after == null) {
        DateTime da = DateTime.now().add(Duration(days: -options.days));
        options.after = _formatDate(da);
      }
      return options;
    } else {
      print('''
      This tool checks if recent commits contain tests mentioned in .status files. Usage:
      dart status_files_checker.dart <options>
      Options:
      -after=yyyy-MM-dd - by default current date minus ${options.days} days
      -before=yyyy-MM-dd - current date by default
      -days=N - check commits for N latest days (${options.days} by default)
      -sdk=path_to_sdk - path to Dart SDK (by default it's the current directory)
    ''');
      throw EmptyOptionsException();
    }
  }

  static bool _checkFormat(String arg) {
    RegExp regExp = new RegExp("-.*=.*");
    return regExp.hasMatch(arg);
  }

  static String _formatDate(DateTime date) {
    return "${date.year}-${date.month < 10 ? "0" + date.month.toString() : date.month}-${date.day < 01 ? "0" + date.day.toString() : date.day}";
  }
}

Map<String, List<String>> findAndReadStatusFiles(String sdk) {
  Directory testsDir = new Directory(sdk + Platform.pathSeparator + "tests");
  if (!testsDir.existsSync()) {
    throw StatusFilesException("Directory ${testsDir.path} doesn't exist");
  }
  Map<String, List<String>> map = new Map<String, List<String>>();
  List<FileSystemEntity> list = testsDir.listSync(recursive: true);
  for (FileSystemEntity fse in list) {
    if (fse is File && fse.path.endsWith(".status")) {
      addAll(map, readStatusFile(fse));
    }
  }
  return map;
}

Map<String, List<String>> readStatusFile(File f) {
  // get test suite prefix
  String prefix = "";
  final test = Platform.pathSeparator + "tests" + Platform.pathSeparator;
  final ind = f.path.indexOf(test);
  final suite = f.path.substring(ind + test.length,
      f.path.indexOf(Platform.pathSeparator, ind + test.length + 1));
  if (suite != "co19" && suite != "co19_2") {
    prefix = "tests/" + suite + "/";
  }
  // now read the file
  final regExp = new RegExp(".*:(\\s)*(Skip|Crash|RuntimeError){1}(\\s|#)");
  List<String> strings = f.readAsLinesSync();
  Map<String, List<String>> map = new Map<String, List<String>>();
  for (String s in strings) {
    RegExpMatch? match = regExp.firstMatch(s);
    if (match != null) {
      String testAndStatus = prefix +
          s.substring(match.start,
              match.end); // LibTest/ffi/Array/PointerArray_A01_t01: Skip
      // Now process multitests like io/platform_resolved_executable_test/06: RuntimeError
      testAndStatus =
          testAndStatus.replaceFirst(new RegExp(r"\/([0-9]{2,3}|none):"), ":");
      List<String> parts = testAndStatus.split(":");
      map[parts[0]] = [f.path + parts[1]];
    }
  }
  return map;
}

void addAll(Map<String, List<String>> map1, Map<String, List<String>> map2) {
  for (String k in map2.keys) {
    if (map1.containsKey(k)) {
      map1[k]?.addAll(map2[k]!);
    } else {
      map1[k] = map2[k]!;
    }
  }
}

class EmptyOptionsException implements Exception {}

class OptionsException implements Exception {
  final String text;
  OptionsException(this.text);
}

class StatusFilesException implements Exception {
  final String text;
  StatusFilesException(this.text);
}
