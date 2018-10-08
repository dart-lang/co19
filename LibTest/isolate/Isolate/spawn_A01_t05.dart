/*
 * Copyright (c) 2011-2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Isolate> spawn(void entryPoint(message), message,
 * {bool paused: false, bool errorsAreFatal, SendPort onExit, SendPort onError})
 *
 *    The argument entryPoint specifies the entry point of the spawned isolate.
 * It must be a top-level function or a static method that takes one argument -
 * that is, one-parameter functions that can be compile-time constant function
 * values. It is not allowed to pass the value of function expressions or
 * an instance method extracted from an object.
 *
 *    The entry-point function is invoked with the initial message. Usually
 * the initial message contains a SendPort so that the spawner and spawnee can
 * communicate with each other.
 *
 * @description Checks that sending multiple messages works fine.
 * @author iefremov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";

final int MSG_NUM = 100;

iMain(SendPort replyPort) {
  var receivePort = new ReceivePort();

  replyPort.send(receivePort.sendPort);

  receivePort.listen((message) {
    replyPort.send(message-1);
    if(message == 0) {
      receivePort.close();
    }
  });
}

main() {
  var receivePort = new ReceivePort();
  var requestPort;

  void receiveHandler(var message) {
    if (message is SendPort) {
      requestPort=message;
      asyncStart();
      requestPort.send(MSG_NUM);
    } else if (message is int) {
      if (message==0) {
        receivePort.close();
      } else {
        asyncStart();
        requestPort.send(message);
      }
    } else {
      Expect.fail("unexpected message type: ${message.runtimeType}");
    }
    asyncEnd();
  }

  asyncStart();
  Isolate.spawn(iMain, receivePort.sendPort);
  receivePort.listen(receiveHandler);
}
