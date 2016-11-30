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
  dynamic i1 = 1, i2 = 2, i3 = 3, i4 = 4;

  new Future.delayed(ONE_SECOND).then(
     (_) {
        sendPort.send("second");
        // An error that should stop the isolate
        sendPort.send(", " + i2);
        sendPort.send("attempt");
     }
  );
  new Future.delayed(TWO_SECONDS).then(
     (_) {
        sendPort.send("third");
        // An error that should stop the isolate
        sendPort.send(", " + i3);
        sendPort.send("attempt");
     }
  );
  new Future.delayed(THREE_SECONDS).then(
     (_) {
        sendPort.send("finish");
        // An error that should stop the isolate
        sendPort.send(", " + i4);
        sendPort.send("attempt");
     }
  );
  sendPort.send("hello");
  // An error that should stop the isolate
  sendPort.send(", " + i1);
  sendPort.send("world");
}
