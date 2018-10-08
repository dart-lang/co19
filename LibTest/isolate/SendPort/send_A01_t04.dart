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
 * @description Checks that SendPorts, lists and maps containing SendPorts
 * are sent properly.
 *
 *  @author kaigorodov
 */
import "dart:isolate";
import "../../../Utils/expect.dart";

void iMain(var messages) {
  var replyPort=messages[0];
  for(var v in messages) {
    replyPort.send(v);
  }
}

main() {
  var receivePort = new ReceivePort();
  var sport = receivePort.sendPort;
  var messages = [sport, [sport], {"1":receivePort.sendPort}];
  asyncStart();
  Isolate.spawn(iMain, messages);
  int i = 0;
  receivePort.listen((message) {
    Expect.deepEquals(messages[i], message);
    i++;
    if (i == messages.length) {
      receivePort.close();
      asyncEnd();
    }
  });
}
