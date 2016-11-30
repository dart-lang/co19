/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "IsolateUtil.dart";

main(List<String> args, SendPort sendPort) {
  dynamic i = 1;

  // this should awake the isolate from suspended state, caused by error
  new Future.delayed(TWO_SECONDS).then(
      (_) {
        sendPort.send("finish");
      }
  );
  sendPort.send("hello");
  // An error that should stop the isolate
  sendPort.send(", " + i);
  sendPort.send("world");
}
