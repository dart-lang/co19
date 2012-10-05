/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is legal to create several SendPorts from the same ReceivePort.
 * @description Checks that it is possible to create several send ports from the same receive port.
 * Positive version of the test toSendPort_A01_t02.dart
 * @author iefremov
 */

import "dart:isolate";

void main() {
  ReceivePort rPort = new ReceivePort();

  int x = 1;
  rPort.receive(void func(var message, SendPort replyTo) {
    x++;
    if(x == 1000) {
      rPort.close();
    }
  });

  for(int i = 0; i < 1000; i++) {
    SendPort s = rPort.toSendPort();
    s.send("message1", null);
  }
}