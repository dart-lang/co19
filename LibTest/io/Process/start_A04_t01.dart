/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<Process> start(
 *     String executable,
 *     List<String> arguments, {
 *     String workingDirectory,
 *     Map<String, String> environment,
 *     bool includeParentEnvironment: true,
 *     bool runInShell: false,
 *     ProcessStartMode mode: ProcessStartMode.normal
 * })
 * ...
 * If mode is ProcessStartMode.normal (the default) a child process will be
 * started with stdin, stdout and stderr connected.
 *
 * @description Checks that if mode is ProcessStartMode.normal (the default) a
 * child process will be started with stdin, stdout and stderr connected. Also
 * process pid and exitCode are available.
 * @author ngl@unipro.ru
 * @issue 30945
 */
import "dart:convert";
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

String command = "";
List<String> args = new List<String>();

void setCommand() {
  if (Platform.isWindows) {
    command = Platform.resolvedExecutable;
    args = ['--version'];
  } else {
    command = 'pwd';
    args = [];
  }
}

Future testEmpty(var stream) {
  return stream.toList().then((List errList) {
    Expect.equals(0, errList.length);
  });
}

Future testNotEmpty(var stream) {
  return stream.toList().then((List outList) {
    Utf8Decoder decoder = new Utf8Decoder();
    String decoded = decoder.convert(outList[0]);
    Expect.isTrue(decoded.length > 0);
  });
}

main() {
  setCommand();
  asyncStart();
  Process.start(command, args, mode: ProcessStartMode.normal)
      .then((Process process) {
    if (Platform.isWindows) {
      testEmpty(process.stdout).then((_) {
        testNotEmpty(process.stderr).then((_) {
          asyncEnd();
        });
      });
    } else {
      testEmpty(process.stderr).then((_) {
        testNotEmpty(process.stdout).then((_) {
          asyncEnd();
        });
      });
    }
  });
}
