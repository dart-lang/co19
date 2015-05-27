/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory ReceivePort.fromRawReceivePort(RawReceivePort rawPort)
 * Creates a ReceivePort from a RawReceivePort.
 * @description Checks that incoming messages are buffered until a listener is registered.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";

var counter=10;

void main() {
  RawReceivePort rrPort = new RawReceivePort();
  ReceivePort rPort = new ReceivePort.fromRawReceivePort(rrPort);
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