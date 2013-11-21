/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionFuture<Isolate> spawn(void entryPoint(message), message)
 * Creates and spawns an isolate that shares the same code as the current isolate.
 * The entry-point function is invoked with the initial message.
 * @description Checks that sending multiple messages works fine.
 * @author iefremov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

final MSG_NUM = 100;

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
