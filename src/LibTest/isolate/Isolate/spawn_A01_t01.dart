/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionFuture<Isolate> spawn(void entryPoint(message), message)
 * Creates and spawns an isolate that shares the same code as the current isolate.
 * The argument entryPoint specifies the entry point of the spawned isolate.
 * It must be a static top-level function or a static method that takes no arguments.
 * It is not allowed to pass a function closure.
 * The entry-point function is invoked with the initial message.
 * Returns a future that will complete with an Isolate instance.
 * @description Checks that the function spawns the isolate that executes the
 * specified top-level function.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

var expectedMessage="message";

var receivePort = new ReceivePort();

void receiveHandler(var message) {
  Expect.equals(expectedMessage, message);
  receivePort.close();
  asyncEnd();
}

void iMain(SendPort replyPort) {
  replyPort.send(expectedMessage);
}

main() {
  asyncStart();
  Isolate.spawn(iMain, receivePort.sendPort);
  receivePort.listen(receiveHandler);
}
