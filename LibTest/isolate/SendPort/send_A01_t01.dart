/*
 * Copyright (c) 2011-2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void send(message)
 *    Sends an asynchronous message through this send port, to its corresponding
 * ReceivePort.
 *    The content of message can be: primitive values (null, num, bool, double,
 * String), instances of SendPort, and lists and maps whose elements are any
 * of these. List and maps are also allowed to be cyclic.
 *
 * @description Checks that various primitive values are sent properly.
 *
 * @author kaigorodov
 */
import "dart:isolate";
import "../../../Utils/expect.dart";
import "send_A01_util.dart";

void iMain(SendPort replyPort) {
  for(var v in messagesList) {
    replyPort.send(v);
  }
}

main() {
  asyncStart();
  var receivePort = new ReceivePort();
  int i = 0;
  receivePort.listen((message) {
    Expect.equals(messagesList[i], message);
    i++;
    if (i == messagesList.length) {
      receivePort.close();
      asyncEnd();
    }
  });
  Isolate.spawn(iMain, receivePort.sendPort);
}
