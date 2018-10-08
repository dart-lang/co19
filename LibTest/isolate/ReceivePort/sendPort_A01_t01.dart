/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final SendPort sendPort
 * Returns a SendPort that sends to this receive port.
 * @description Checks that a new SendPort that sends to this receive port is returned.
 * @author msyabro
 * @reviewer kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";

void main() {
  ReceivePort rPort = new ReceivePort();
  var sPort = rPort.sendPort;
  Expect.isTrue(sPort is SendPort);
  
  asyncStart();
  rPort.listen((var message) {
    rPort.close();
    asyncEnd();
  });
  
  sPort.send("message1");
}