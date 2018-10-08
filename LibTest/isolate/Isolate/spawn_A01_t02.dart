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
 * @description Checks spawning 3 isolates for one function.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";

var expectedMessage="message";

class Connection {
  var receivePort = new ReceivePort();

  void receiveHandler(var message) {
    Expect.equals(expectedMessage, message);
    receivePort.close();
    asyncEnd();
  }

  start() {
    asyncStart();
    Isolate.spawn(iMain, receivePort.sendPort);
    receivePort.listen(receiveHandler);
  }
}

void iMain(SendPort replyPort) {
  replyPort.send(expectedMessage);
}

main() {
  for (int k=0; k<3; k++) {
    new Connection().start();
  }
}
