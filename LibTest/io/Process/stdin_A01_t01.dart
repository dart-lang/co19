/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion IOSink stdin
 *
 * Returns the standard input stream of the process as an IOSink.
 *
 * @description Checks that [stdin] returns the standard input stream of the
 * process as an IOSink.
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
    command = 'cat';
    args = [];
  }
  if (Platform.isWindows) {
    command = 'echo';
    args = ['abc'];
  }
}

main() {
  setCommand();
  Process.start(command, args).then((Process process) {
    Expect.isTrue(process.stdin is IOSink);

    Future<List<List<int>>> outList = process.stdout.toList();
    outList.then((List outList) {
      if (outList.length > 0) {
        Utf8Decoder decode = new Utf8Decoder();
        String decoded = decode.convert(outList[0]);
        Expect.isTrue(
            decoded.contains("Hello, world!Hello, galaxy!Hello, universe!"));
      } else {
        Expect.fail("stdout doesn't contain stdin information");
      }
    });

    Future<List<List<int>>> errList = process.stderr.toList();
    errList.then((List errList) {
      if (errList.length > 0) {
        Utf8Decoder decode = new Utf8Decoder();
        String decoded = decode.convert(errList[0]);
        Expect.fail('stderr contains $decoded');
      }
    });

    process.stdin.write('Hello, world!');
    process.stdin.write('Hello, galaxy!');
    process.stdin.write('Hello, universe!');
    process.stdin.close();
  });
}
