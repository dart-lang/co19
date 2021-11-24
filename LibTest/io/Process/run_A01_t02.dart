// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion
/// Future<ProcessResult> run(
///     String executable,
///     List<String> arguments, {
///     String workingDirectory,
///     Map<String, String> environment,
///     bool includeParentEnvironment: true,
///     bool runInShell: false,
///     Encoding stdoutEncoding: systemEncoding,
///     Encoding stderrEncoding: systemEncoding
/// })
///
/// Starts a process and runs it non-interactively to completion. The process
/// run is executable with the specified arguments.
/// ...
/// Returns a Future<ProcessResult> that completes with the result of running
/// the process, i.e., exit code, standard out and standard in.
///
/// @description Checks that static method [run] starts a process, runs it
/// non-interactively to completion and returns a Future<ProcessResult> that
/// completes with the result of running the process, i.e., exit code, standard
/// out and standard in. Tests dart process which exits correctly with exit code
/// 0.
/// @author sgrekhov@unipro.ru
/// @issue 31611

import "dart:io";
import "../../../Utils/expect.dart";

runMain() {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();

  asyncStart();
  Process.run(executable, [...Platform.executableArguments, eScript, "run"])
      .then((ProcessResult results) {
    Expect.equals(0, results.exitCode);
    Expect.equals("Lily was here", results.stdout);
    Expect.equals("", results.stderr);
    asyncEnd();
  });
}

runProcess() {
  stdout.write("Lily was here");
}

main(List<String> args) {
  if (args.length > 0)
    runProcess();
  else {
    runMain();
  }
}
