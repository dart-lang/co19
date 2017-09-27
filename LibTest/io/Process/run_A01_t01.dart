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
 *     Encoding stdoutEncoding: SYSTEM_ENCODING,
 *     Encoding stderrEncoding: SYSTEM_ENCODING
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
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  bool testExit = false;
  Future<ProcessResult> fProcessResult = Process.run('echo', ['abc']);
  fProcessResult.then((ProcessResult results) {
    Expect.isTrue(testExit);
    int exitCode = results.exitCode;
    Expect.equals(0, exitCode);
    Expect.isTrue(results.stdout is String);
    Expect.isTrue((results.stdout).substring(0, 3) == "abc");
    Expect.isTrue(results.stderr is String);
    Expect.equals("", results.stderr);
  });
  testExit = true;
}
