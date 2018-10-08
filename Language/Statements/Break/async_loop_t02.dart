/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If sE is an asynchronous for loop, its associated
 * stream subscription is canceled.
 *
 * @description Check that break cancels subscription to the stream associated
 * with the asynchronous loop. Break statement is inside if statement.
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';

Future test1() async {
  bool streamCanceled = false;
  StreamController<String> streamController = new StreamController<String>();
  streamController.add('a');
  streamController.add('b');
  streamController.onCancel = () { streamCanceled = true; };
  await for (String s in streamController.stream) {
    if (s == 'b') {
      break;
    }
  }
  Expect.isTrue(streamCanceled);
}

Future test2() async {
  bool streamCanceled = false;
  StreamController<String> streamController = new StreamController<String>();
  streamController.add('a');
  streamController.add('b');
  streamController.onCancel = () { streamCanceled = true; };
  L: await for (String s in streamController.stream) {
    if (s == 'b') {
      break L;
    }
  }
  Expect.isTrue(streamCanceled);
}

main() {
  asyncStart();
  Future.wait([test1(), test2()]).then((v) => asyncEnd());
}