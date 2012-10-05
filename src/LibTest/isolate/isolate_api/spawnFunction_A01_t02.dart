/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Creates and spawns an isolate that shares the same code as the current
 * isolate, but that starts from [topLevelFunction]. The [topLevelFunction]
 * argument must be a static top-level function or a static method that takes no
 * arguments. It is illegal to pass a function closure.
 *
 * When any isolate starts (even the main script of the application), a default
 * [ReceivePort] is created for it. This port is available from the top-level
 * getter [port] defined in this library.
 *
 * [spawnFunction] returns a [SendPort] derived from the child isolate's default
 * port.
 * @description Checks spawning 3 isolates for one function.
 * @author iefremov
 */

import "dart:isolate";

f() {
  port.receive((message, replyTo) {
    replyTo.send(-message);
    port.close();
  });
}

main() {
  SendPort send_port1 = spawnFunction(f);
  SendPort send_port2 = spawnFunction(f);
  SendPort send_port3 = spawnFunction(f);

  ReceivePort rport1 = new ReceivePort();
  ReceivePort rport2 = new ReceivePort();
  ReceivePort rport3 = new ReceivePort();

  send_port1.send(1, rport1.toSendPort());
  send_port2.send(2, rport2.toSendPort());
  send_port3.send(3, rport3.toSendPort());

  rport1.receive((message, replyTo){
    Expect.equals(-1, message);
    rport1.close();
  });
  rport2.receive((message, replyTo){
    Expect.equals(-2, message);
    rport2.close();
  });
  rport3.receive((message, replyTo){
    Expect.equals(-3, message);
    rport3.close();
  });
}

