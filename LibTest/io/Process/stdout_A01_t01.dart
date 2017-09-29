/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Stream<List<int>> stdout
 *
 * Returns the standard output stream of the process as a Stream.
 *
 * @description Checks that [stdout] returns Stream<List<int>> value that is the
 * standard output stream of the process as a Stream.
 * @author ngl@unipro.ru
 */
import "dart:async";
import 'dart:convert';
import "dart:io";
import "../../../Utils/expect.dart";

String command;
List<String> args;

void setCommand() {
  if (Platform.isLinux) {
    command = 'echo';
    args = ['-start'];
  }
  if (Platform.isWindows) {
    command = 'echo';
    args = ['abc'];
  }
}

main() {
  setCommand();
  Process.start(command, args).then((Process process) {
    Expect.isTrue(process.stdout is Stream<List<int>>);

    Future<List<List<int>>> outList = process.stdout.toList();
    outList.then((List outList) {
      Utf8Decoder decode = new Utf8Decoder();
      String decoded = decode.convert(outList[0]);
      Expect.isTrue(decoded.contains("-start"));
    });

    Future<List<List<int>>> errList = process.stderr.toList();
    errList.then((List errList) {
      Expect.equals(0, errList.length);
    });
  });
}
