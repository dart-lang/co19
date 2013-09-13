/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a new send port that sends to this receive port.
 * @description Checks that a new SendPort that sends to this receive port is created.
 * @author msyabro
 * @reviewer kaigorodov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";

void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort = rPort.toSendPort();
  int x = 1;
  
  asyncStart();
  rPort.receive((var message, SendPort replyTo) {
    rPort.close();
    asyncEnd();
  });
  
  sPort.send("message1", null);
}