/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Opens a long-lived port for receiving messages. 
 * The returned port must be explicitly closed through [ReceivePort.close].
 * @description Checks that the port is created without exceptions.
 * @author msyabro
 * @reviewer kaigorodov
 */

#import('dart:isolate');

void main() {
  ReceivePort rPort = new ReceivePort();
  rPort.close();
}