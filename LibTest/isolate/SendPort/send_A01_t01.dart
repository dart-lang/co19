/*
 * Copyright (c) 2011-2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void send(message)
 * Sends an asynchronous message to this send port.
 * The message is copied to the receiving isolate.
 * The content of message can be: primitive values (null, num, bool, double, String),
 * instances of SendPort, and lists and maps whose elements are any of these.
 * @description Checks that various primitive values could be sent properly.
 * @author kaigorodov
 */
import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";
import "send_A01_util.dart";

void iMain(SendPort replyPort) {
  for(var v in messagesList) {
    replyPort.send(v);
  }
}

main() {
  var receivePort = new ReceivePort();
  asyncStart();
  Isolate.spawn(iMain, receivePort.sendPort);
  int i = 0;
  
  receivePort.listen((message) {
    Expect.equals(messagesList[i], message);
    i++;
    if (i == messagesList.length) {
      receivePort.close();
      asyncEnd();
    }
  });
}
