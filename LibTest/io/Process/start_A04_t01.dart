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
 * ...
 * If mode is ProcessStartMode.NORMAL (the default) a child process will be
 * started with stdin, stdout and stderr connected.
 *
 * @description Checks that if mode is ProcessStartMode.NORMAL (the default) a
 * child process will be started with stdin, stdout and stderr connected. Also
 * process pid and exitCode are available.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:convert";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Process
      .start('pwd', [], mode: ProcessStartMode.NORMAL)
      .then((Process process) {
    Expect.isTrue(process.pid is int);

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

    Expect.isTrue(process.exitCode is Future<int>);
  });
}
