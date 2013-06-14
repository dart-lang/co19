/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void send(message, [SendPort replyTo])
 * Sends an asynchronous message to this send port.
 * The message is copied to the receiving isolate.
 * @description Checks that message is sent to the ReceivePort.
 * @runtime-error
 * @author msyabro
 * @reviewer kaigorodov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";

void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort = rPort.toSendPort();
  
  rPort.receive((var message, SendPort replyTo) {
    rPort.close();
    asyncEnd();
  });
  
  asyncStart();
  sPort.send("message1", null);
}