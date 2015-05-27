/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory ReceivePort()
 * Opens a long-lived port for receiving messages.
 * A ReceivePort is a non-broadcast stream.
 * This means that it buffers incoming messages until a listener is registered.
 * Only one listener can receive messages.
 * See Stream.asBroadcastStream for transforming the port to a broadcast stream.
 * A receive port is closed by canceling its subscription.
 * @description Checks that incoming messages are buffered until a listener is registered..
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";

var counter=10;

void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort=rPort.sendPort;
  for (int k=counter; k>0; k--) {
    sPort.send(k);
  }
  rPort.listen((message) {
    Expect.equals(counter, message);
    if (message>1) {
      counter--;
    } else {
      rPort.close();
    }
  });
}