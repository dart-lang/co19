/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Future<ProcessResult> run(
 *     String executable,
 *     List<String> arguments, {
 *     String workingDirectory,
 *     Map<String, String> environment,
 *     bool includeParentEnvironment: true,
 *     bool runInShell: false,
 *     Encoding stdoutEncoding: systemEncoding,
 *     Encoding stderrEncoding: systemEncoding
 * })
 *
 * Starts a process and runs it non-interactively to completion. The process
 * run is executable with the specified arguments.
 * ...
 * Returns a Future<ProcessResult> that completes with the result of running
 * the process, i.e., exit code, standard out and standard in.
 *
 * @description Checks that static method [run] starts a process and runs it
 * non-interactively to completion. Returns a Future<ProcessResult> that
 * completes with the result of running the process, i.e., exit code, standard
 * out and standard in.
 * @author ngl@unipro.ru
 * @issue 30945
 */
import "dart:io";
import "../../../Utils/expect.dart";

String command = "";
List<String> args = new List<String>();

void setCommand() {
  if (Platform.isWindows) {
    command = Platform.resolvedExecutable;
    args = ['--version'];
  } else {
    command = 'echo';
    args = ['abc'];
  }
}

main() {
  setCommand();
  asyncStart();
  Process.run(command, args).then((ProcessResult results) {
    Expect.equals(0, results.exitCode);
    Expect.isTrue(results.stdout is String);
    Expect.isTrue(results.stderr is String);
    if (!Platform.isWindows) {
      Expect.equals("abc", (results.stdout).substring(0, 3));
      Expect.equals("", results.stderr);
    } else {
      Expect.isTrue(results.stderr.indexOf(Platform.version) > -1);
      Expect.equals("", results.stdout);
    }
    asyncEnd();
  });
}
