/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates and spawns an isolate whose code is available at uri. Like with
 * spawnFunction, the child isolate will have a default ReceivePort, and this
 * function returns a SendPort derived from it.
 * @description Checks that the function spawns the isolate that executes the
 * specified top-level function. Also checks that the default ReceivePort
 * is available from the top-level getter and that the returned SendPort
 * is actually bound to the child default ReceivePort.
 * @author iefremov
 */

#import("dart:isolate");

main() {
  SendPort send_port = spawnUri("spawnUri_A01_t01_isolate.dart");
  send_port.send("go!", port.toSendPort());

  port.receive((message, replyTo){
    Expect.equals("ok!", message);
    port.close();
  });
}

