/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<List<int>> stderr
 *
 * Returns the standard error stream of the process as a Stream.
 *
 * @description Checks that [stderr] returns Stream<List<int>> value that is the
 * standard error stream of the process as a Stream.
 * @author ngl@unipro.ru
 */
import "dart:async";
import 'dart:convert';
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Process.start('pwd', ['-start']).then((Process process) {
    Expect.isTrue(process.stderr is Stream<List<int>>);

    Future<List<List<int>>> outList = process.stdout.toList();
    outList.then((List outList) {
      Expect.equals(0, outList.length);
    });

    Future<List<List<int>>> errList = process.stderr.toList();
    errList.then((List errList) {
      Utf8Decoder decode = new Utf8Decoder();
      String decoded = decode.convert(errList[0]);
      Expect.isTrue(decoded.contains("pwd: invalid option "));
    });
  });
}
