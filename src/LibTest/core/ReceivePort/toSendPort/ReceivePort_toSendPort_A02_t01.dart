/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The send port is
 * canonicalized so repeated invocations of this method are
 * guaranteed to return the same (===) send port.
 * @description Checks that all returned SendPorts are the same.
 * ReceivePort is the same
 * @author msyabro
 * @reviewer kaigorodov
 */

void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort = rPort.toSendPort();
  for(int i = 0; i < 100; i++) {
//    Expect.identical(sPort, rPort.toSendPort());
    Expect.isTrue(sPort === rPort.toSendPort());
  }

  rPort.close();
}