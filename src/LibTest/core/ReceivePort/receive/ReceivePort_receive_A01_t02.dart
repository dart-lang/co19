/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Sets up a callback function for receiving
 * pending or future messages on this receive port.
 * @description Tries to pass non-function object as [callback].
 * @author msyabro
 * @runtime-error //no exception is thrown
 */

void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort = rPort.toSendPort();
  
  rPort.receive(null);
  sPort.send(2, sPort);
}