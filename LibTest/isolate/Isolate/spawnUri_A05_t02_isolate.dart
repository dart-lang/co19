/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * Passive isolate, waits for requests
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";

main(List<String> args, List message) {
  dynamic i = 1;
  SendPort sendPort = message[1];
  ReceivePort receivePort = new ReceivePort();
  receivePort.listen(
     (data) {
        sendPort.send(data);
        // An error that should stop the isolate
        sendPort.send(", " + i); /// static type warning
        sendPort.send("hello");
     }
  );
  message[0].send(receivePort.sendPort);
}