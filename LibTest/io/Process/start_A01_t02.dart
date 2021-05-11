// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Future<Process> start(
///     String executable,
///     List<String> arguments, {
///     String workingDirectory,
///     Map<String, String> environment,
///     bool includeParentEnvironment: true,
///     bool runInShell: false,
///     ProcessStartMode mode: ProcessStartMode.normal
/// })
///
/// Starts a process running the executable with the specified arguments.
/// Returns a Future<Process> that completes with a Process instance when the
/// process has been successfully started. That Process object can be used to
/// interact with the process. If the process cannot be started the returned
/// Future completes with an exception.
///
/// @description Checks that static method [start] starts a process running the
/// executable with the specified arguments. Returns a Future<Process> that
/// completes with a Process instance when the process has been successfully
/// started. Check running dart test that finished with error.
/// @author ngl@unipro.ru

import "dart:convert";
import "dart:io";
import "../../../Utils/expect.dart";

runMain() {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();

  asyncStart();
  Process.start(executable, [...Platform.executableArguments, eScript, "run"])
      .then((process) {
    process.stdout.toList().then((List outList) {
      Expect.equals(0, outList.length);
    }).then((_) {
      process.stderr.transform(utf8.decoder)
          .transform(const LineSplitter()).toList().then((List<String> errList) {
        Expect.isTrue(errList[0].contains("Unhandled exception") &&
            errList[1].contains("Test exception start_A01_t02"));
        asyncEnd();
      });
    });
  });
}

runProcess() {
  throw new Exception("Test exception start_A01_t02");
}

main(List<String> args) {
  if (args.length > 0)
    runProcess();
  else {
    runMain();
  }
}
