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
 *     Encoding stdoutEncoding: systemEncoding,
 *     Encoding stderrEncoding: systemEncoding
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
  ProcessResult processResult = Process.runSync(command, args);
  Expect.equals(0, processResult.exitCode);
  Expect.isTrue(processResult.stdout is String);
  Expect.isTrue(processResult.stderr is String);
  if (Platform.isWindows) {
    Expect.isTrue((processResult.stderr).indexOf(Platform.version) > -1);
    Expect.equals("", processResult.stdout);
  } else {
    Expect.isTrue((processResult.stdout).substring(0, 3) == "abc");
    Expect.equals("", processResult.stderr);
  }
}
