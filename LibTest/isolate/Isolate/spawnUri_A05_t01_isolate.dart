/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * Active isolate, i.e. the isolate actively sends data
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "IsolateUtil.dart";

main(List<String> args, SendPort sendPort) {
  // this may awake the isolate from suspended state, caused by error
  new Future.delayed(TWO_SECONDS).then(
      (_) {
        sendPort.send("finish");
      }
  );
  sendPort.send("hello");
  // An error that should stop the isolate
  dynamic i = 1;
  sendPort.send(", " + i); /// static type warning
  sendPort.send("world");
}
