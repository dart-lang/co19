/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion S
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
 * If includeParentEnvironment is true, the process's environment will include
 * the parent process's environment, with environment taking precedence. Default
 * is true.
 *
 * @description Checks that if includeParentEnvironment is false, the process's
 * environment will not include the parent process's environment.
 * @author ngl@unipro.ru
 */
import "dart:convert";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Map<String, String> m = new Map<String, String>();
  m["a"] = "aa";

  String envString = Platform.environment.toString();
  String executable = Platform.resolvedExecutable;
  File file = new File.fromUri(Platform.script.resolve("checkEnvironment_lib.dart"));

  asyncStart();
  Process.start(executable, [file.path],
      environment: m, includeParentEnvironment: false).then((Process process) {
    process.stdout.toList().then((List outList) {
      Utf8Decoder decode = new Utf8Decoder();
      String decoded = decode.convert(outList[0]);
      Expect.isTrue(decoded.toLowerCase().contains('a: aa'));
      Expect.isFalse(decoded.contains(envString.substring(1)));
    }).then((_) {
      process.stderr.toList().then((List errList) {
        Expect.equals(0, errList.length);
        asyncEnd();
      });
    });
  });
}
