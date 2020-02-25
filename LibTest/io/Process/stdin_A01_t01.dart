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
import 'dart:convert';
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

String command = "";
List<String> args = new List<String>();

void setCommand() {
  command = Platform.resolvedExecutable;
  args = ['stream_lib.dart', '1', '2', 'true'];
}

main() {
  setCommand();
  bool found = false;
  asyncStart();
  Process.start(command, args).then((Process process) {
    process.stdout.toList().then((List event) {
      Utf8Decoder decoder = new Utf8Decoder();
      for (int i = 0; i < event.length; i++) {
        String decoded = decoder.convert(event[i]);
        if (decoded.contains("Hello, world!Hello, galaxy!Hello, universe!")) {
          found = true;
        }
      }
    }).then((_) {
      Expect.isTrue(found);
      asyncEnd();
    });
    process.stdin.write('Hello, world!');
    process.stdin.write('Hello, galaxy!');
    process.stdin.write('Hello, universe!');
    process.stdin.close();
  });
}
