/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory ReceivePort.fromRawReceivePort(RawReceivePort rawPort)
 * The handler of the given rawPort is overwritten during the construction of the result.
 * @description Checks that the handler of the given rawPort is overwritten
 * during the construction of the result
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";

var counter=10;

void receiveHandler(var message) {
  Expect.fail("not overwritten");
}

void main() {
  RawReceivePort rrPort = new RawReceivePort(receiveHandler);
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