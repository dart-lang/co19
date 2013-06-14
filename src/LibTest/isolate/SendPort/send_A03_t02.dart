/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void send(message, [SendPort replyTo])
 * If specified, the replyTo port will be provided to the receiver
 * to facilitate exchanging sequences of messages.
 * @description The replyTo port is the same as this SendPort.
 * @author msyabro
 * @reviewer kaigorodov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";

void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort = rPort.toSendPort();
  
  rPort.receive((var message, SendPort replyTo) {
    if (message == 100) {
      rPort.close();
    } else {
      message ++;
      asyncStart();
      replyTo.send(message, replyTo);
    }
    asyncEnd();
  });
  
  asyncStart();
  sPort.send(1, sPort);
}