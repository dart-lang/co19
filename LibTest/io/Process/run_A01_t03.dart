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
 * out and standard in. Test that there should be an error code 254 if invalid
 * file path is used on Windows
 * (see https://github.com/dart-lang/sdk/issues/31611)
 * @author sgrekhov@unipro.ru
 * @issue 31611
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  if (Platform.isWindows) {
    String executable = Platform.resolvedExecutable;
    File file = new File.fromUri(Platform.script.resolve("not_existing.dart"));
    asyncStart();
    Process.run(executable, [file.path]).then((ProcessResult results) {
      Expect.equals(254, results.exitCode);
      Expect.notEquals("", results.stderr);
      asyncEnd();
    });
  }
}
