/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates and spawns an isolate whose code is available at uri. Like with
 * spawnFunction, the child isolate will have a default ReceivePort, and this
 * function returns a SendPort derived from it.
 * @description Checks spawning 3 isolates from a single source.
 * @author iefremov
 */

import "dart:isolate";

main() {
  SendPort send_port1 = spawnUri("spawnUri_A01_t02_isolate.dart");
  SendPort send_port2 = spawnUri("spawnUri_A01_t02_isolate.dart");
  SendPort send_port3 = spawnUri("spawnUri_A01_t02_isolate.dart");

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
