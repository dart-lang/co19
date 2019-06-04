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
 *
 * Starts a process running the executable with the specified arguments.
 * Returns a Future<Process> that completes with a Process instance when the
 * process has been successfully started. That Process object can be used to
 * interact with the process. If the process cannot be started the returned
 * Future completes with an exception.
 *
 * @description Checks that static method [start] starts a process running the
 * executable with the specified arguments. Returns a Future<Process> that
 * completes with a Process instance when the process has been successfully
 * started. Check running dart test that finished with error.
 * @author ngl@unipro.ru
 */
import "dart:convert";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  String executable = Platform.resolvedExecutable;
  File file = new File.fromUri(Platform.script.resolve("start_A01_t02_lib.dart"));

  asyncStart();
  Process.start(executable, [file.path]).then((process) {
    process.stdout.toList().then((List outList) {
      Expect.equals(0, outList.length);
    }).then((_) {
      process.stderr.toList().then((List errList) {
        Utf8Decoder decoder = new Utf8Decoder();
        String decoded = decoder.convert(errList[0]);
        Expect.isTrue(decoded.contains("'main'")); // Unable to find 'main' or The binary program does not contain 'main'
        asyncEnd();
      });
    });
  });
}
