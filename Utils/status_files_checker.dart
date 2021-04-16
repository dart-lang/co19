/*
 * Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
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

  Map<String,List<String>> map = findAndReadStatusFiles(options.sdk);
  List<String> arguments = ['log', '--pretty=format:"%h"', '--after=${options.after}'];
  ProcessResult res = await Process.run('git', arguments);
  if (res.exitCode != 0) {
    print(res.stderr);
    return 2;
  }
  List<String> commits = (res.stdout as String).split("\n");
  //print(commits);
  for (var c in commits) {
    c = c.replaceAll('"', '');
    //print("git show --pretty=format:\"\" --name-only $c");
    ProcessResult r = await Process.run('git', ['show', '--pretty=format:""', '--name-only', c]);
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
          print("Test $testName was changed in commit $c and presents in the followins status files");
          print(found);
        }
      }
    }
  }
  return 0;
}

class Options {
  String? after = null;
  String? before = null;
  String sdk = '.';
  int days = 3;

  static Options read(List<String> args) {
    Options options = new Options();
    if (args.length > 0) {
      for (var arg in args) {
        if (!_checkFormat(arg)) {
          throw OptionsException("Unknown argument: '$arg'");
        }
        List<String> pair = arg.substring(1).split("=");
        switch(pair[0]) {
          case "after":
          // TODO implement
            break;
          case "before":
          // TODO implement
            break;
          case "days":
            try {
              options.days = int.parse(pair[1]);
            } on FormatException catch (_) {
              throw new OptionsException("Unable to parse 'days' value: '${pair[0]}'");
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
      -after=dd-MM-yyyy - by default current date minus ${options.days} days
      -before=dd-MM-yyy - current date by default
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
    return "${date.day}-${date.month < 10 ? "0" + date.month.toString() : date.month}-${date.year}";
  }
}

Map<String,List<String>> findAndReadStatusFiles(String sdk) {
  Directory testsDir = new Directory(sdk + Platform.pathSeparator + "tests");
  if (!testsDir.existsSync()) {
    throw StatusFilesException("Directory ${testsDir.path} doesn't exist");
  }
  Map<String,List<String>> map = new Map<String,List<String>>();
  List<FileSystemEntity> list = testsDir.listSync(recursive: true);
  for (FileSystemEntity fse in list) {
    if (fse is File && fse.path.endsWith(".status")) {
      addAll(map, readStatusFile(fse));
    }
  }
  return map;
}

Map<String,List<String>> readStatusFile(File f) {
  // get test suite prefix
  //print(f.path);
  String prefix = "";
  final test = Platform.pathSeparator + "tests" + Platform.pathSeparator;
  final ind = f.path.indexOf(test);
  final suite = f.path.substring(ind + test.length, f.path.indexOf(Platform.pathSeparator, ind + test.length + 1));
  if (suite != "co19" && suite != "co19_2") {
    prefix = "tests/" + suite + "/";
  }
  // now read the file
  final regExp = new RegExp(".*:[ \t]+(Skip|Crash|RuntimeError){1}[^BS]"); // FIXME there must be something like (\s) instead of [^BS] but it doesn't work
  List<String> strings = f.readAsLinesSync();
  Map<String,List<String>> map = new Map<String,List<String>>();
  for (String s in strings) {
    RegExpMatch? match = regExp.firstMatch(s);
    if (match != null) {
      String testAndStatus = prefix + s.substring(match.start, match.end); // LibTest/ffi/Array/PointerArray_A01_t01: Skip
      //print(s.substring(match.start, match.end));
      List<String> parts = testAndStatus.split(":");
      map[parts[0]] = [f.path + parts[1]];
    }
  }
  //print(map);
  return map;
}

void addAll(Map<String,List<String>> map1, Map<String,List<String>> map2) {
  for (String k in map2.keys) {
    if (map1.containsKey(k)) {
      map1[k]?.addAll(map2[k]!);
    } else {
      map1[k] = map2[k]!;
    }
  }
}

class EmptyOptionsException implements Exception {
}

class OptionsException implements Exception {
  final String text;
  OptionsException(this.text);
}

class StatusFilesException implements Exception {
  final String text;
  StatusFilesException(this.text);
}
