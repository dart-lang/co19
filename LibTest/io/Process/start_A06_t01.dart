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
 *     ProcessStartMode mode: ProcessStartMode.NORMAL
 * })
 *
 * If mode is ProcessStartMode.DETACHED_WITH_STDIO a detached process will be
 * created where the stdin, stdout and stderr are connected. The creator can
 * communicate with the child through these. The detached process will keep
 * running even if these communication channels are closed. The process' exit
 * code will not become available when it terminated.
 *
 * @description Checks that if mode is ProcessStartMode.DETACHED_WITH_STDIO a
 * detached process will be created where the stdin, stdout and stderr are
 * connected. The process' exit code will not become available when it
 * terminated.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:convert";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Process
      .start('pwd', [], mode: ProcessStartMode.DETACHED_WITH_STDIO)
      .then((Process process) {
    Future<List<List<int>>> outList = process.stdout.toList();
    outList.then((List outList) {
      Utf8Decoder decode = new Utf8Decoder();
      String decoded = decode.convert(outList[0]);
      Expect.isTrue(decoded.length > 0);
    });

    Future<List<List<int>>> errList = process.stderr.toList();
    errList.then((List errList) {
      Expect.equals(0, errList.length);
    });

    Expect.isTrue(process.stdin is IOSink);

    Expect.isNull(process.exitCode);
  });
}
