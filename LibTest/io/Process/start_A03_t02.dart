// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion S
/// Future<Process> start(
///     String executable,
///     List<String> arguments, {
///     String workingDirectory,
///     Map<String, String> environment,
///     bool includeParentEnvironment: true,
///     bool runInShell: false,
///     ProcessStartMode mode: ProcessStartMode.normal
/// })
/// ...
/// If includeParentEnvironment is true, the process's environment will include
/// the parent process's environment, with environment taking precedence. Default
/// is true.
///
/// @description Checks that if includeParentEnvironment is false, the process's
/// environment will not include the parent process's environment.
/// @author ngl@unipro.ru

import "dart:convert";
import "dart:io";
import "../../../Utils/expect.dart";

runMain() {
  Map<String, String> m = new Map<String, String>();
  m["a"] = "aa";

  String envString = Platform.environment.toString();
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();

  asyncStart();
  Process.start(executable, [...Platform.executableArguments, eScript, "run"],
      environment: m, includeParentEnvironment: false).then((Process process) {
    process.stdout.transform(utf8.decoder).transform(const LineSplitter()).
        toList().then((List outList) {
      Expect.isTrue(outList[0].toLowerCase().contains('a: aa'));
      Expect.isFalse(outList[0].contains(envString.substring(1)));
    }).then((_) {
      process.stderr.toList().then((List errList) {
        Expect.equals(0, errList.length);
        asyncEnd();
      });
    });
  });
}

runProcess() {
  stdout.write(Platform.environment);
}

main(List<String> args) {
  if (args.length > 0)
    runProcess();
  else {
    runMain();
  }
}
