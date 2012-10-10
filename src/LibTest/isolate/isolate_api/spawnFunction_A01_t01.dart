/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SendPort spawnFunction(void topLevelFunction())
 * Creates and spawns an isolate that shares the same code as the current
 * isolate, but that starts from [topLevelFunction].
 *
 * When any isolate starts (even the main script of the application), a default
 * [ReceivePort] is created for it. This port is available from the top-level
 * getter [port] defined in this library.
 *
 * [spawnFunction] returns a [SendPort] derived from the child isolate's default
 * port.
 * @description Checks that the function spawns the isolate that executes the
 * specified top-level function. Also checks that the default ReceivePort
 * is available from the top-level getter and that the returned SendPort
 * is actually bound to the child default ReceivePort.
 * @author iefremov
 */

import "dart:isolate";

f() {
  port.receive((message, replyTo) {
    Expect.equals("alex", message);
    replyTo.send("justas");
    port.close();
  });
}

main() {
  SendPort send_port = spawnFunction(f);
  send_port.send("alex", port.toSendPort());

  port.receive((message, replyTo){
    Expect.equals("justas", message);
    port.close();
  });
}

