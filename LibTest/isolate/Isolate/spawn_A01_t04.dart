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
 * @description Checks that chained spawning of 10 isolates works properly.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";

var expectedMessage="message";

class Connection {
  var receivePort = new ReceivePort();
  SendPort replyPort;
  
  Connection([this.replyPort]);
  
  void receiveHandler(var message) {
    Expect.equals(expectedMessage, message);
    receivePort.close();
    if (replyPort!=null) {
      replyPort.send(message);
    }
    asyncEnd();
  }

  start(int depth) {
    asyncStart();
    Isolate.spawn(iMain, {"replyPort":receivePort.sendPort, "depth":depth});
    receivePort.listen(receiveHandler);
  }
}

void iMain(Map data) {
  var depth=data["depth"];
  SendPort replyPort=data["replyPort"];
  if (depth==0) {
    replyPort.send(expectedMessage);
  } else {
    ReceivePort port = new ReceivePort();
    new Connection(replyPort).start(depth-1);
  }
}

main() {
  new Connection().start(10);
}
