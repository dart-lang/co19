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
 * @author sgrekhov@unipro.ru
 */
import 'dart:convert';
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

String command = "";
List<String> args = new List<String>();

void setCommand() {
  command = Platform.resolvedExecutable;
  args = ['stream_lib.dart', 'Hi stdout', 'Hi, stderr'];
}

main() {
  setCommand();
  asyncStart();
  Process.start(command, args).then((Process process) {
    Expect.isTrue(process.stderr is Stream<List<int>>);
    Utf8Decoder decoder = new Utf8Decoder();
    process.stderr.toList().then((List errList) {
      String decoded = decoder.convert(errList[0]);
      Expect.isTrue(decoded.contains("Hi, stderr"));
      asyncEnd();
    });
  });
}
