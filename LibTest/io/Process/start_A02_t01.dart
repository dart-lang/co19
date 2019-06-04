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
 * Use environment to set the environment variables for the process. If not set
 * the environment of the parent process is inherited. Currently, only US-ASCII
 * environment variables are supported and errors are likely to occur if an
 * environment variable with code-points outside the US-ASCII range is passed
 * in.
 *
 * @description Checks that environment is used to set the environment variables
 * for the process.
 * @author ngl@unipro.ru
 */
import "dart:convert";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Map<String, String> m = new Map<String, String>();
  m["a"] = "aa";

  String executable = Platform.resolvedExecutable;
  File file = new File.fromUri(Platform.script.resolve("checkEnvironment_lib.dart"));

  asyncStart();
  Process.start(executable, [file.path], environment: m).then((Process process) {
    process.stdout.toList().then((List outList) {
      Utf8Decoder decode = new Utf8Decoder();
      String decoded = decode.convert(outList[0]);
      Expect.isTrue(decoded.toLowerCase().contains('a: aa'));
    }).then((_) {
      process.stderr.toList().then((List errList) {
        Expect.equals(0, errList.length);
        asyncEnd();
      });
    });
  });
}
