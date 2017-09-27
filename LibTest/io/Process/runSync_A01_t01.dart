/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * ProcessResult runSync(
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
 * Starts a process and runs it to completion. This is a synchronous call and
 * will block until the child process terminates.
 *
 * The arguments are the same as for Process.run.
 *
 * Returns a ProcessResult with the result of running the process, i.e., exit
 * code, standard out and standard in.
 *
 * @description Checks that static method [runSync] starts a process and runs it
 * to completion. This is a synchronous call and will block until the child
 * process terminates. Returns a ProcessResult with the result of running the
 * process, i.e., exit code, standard out and standard in.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  bool testExit = false;
  ProcessResult processResult = Process.runSync('echo', ['abc']);
  Expect.isFalse(testExit);
  int exitCode = processResult.exitCode;
  Expect.equals(0, exitCode);
  Expect.isTrue(processResult.stdout is String);
  Expect.isTrue((processResult.stdout).substring(0, 3) == "abc");
  Expect.isTrue(processResult.stderr is String);
  Expect.equals("", processResult.stderr);
  testExit = true;
}
