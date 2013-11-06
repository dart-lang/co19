/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SendPort spawnFunction(void topLevelFunction(), [bool unhandledExceptionCallback(IsolateUnhandledException e)])
 * Creates and spawns an isolate that shares the same code as the current
 * isolate, but that starts from [topLevelFunction].
 * @description Checks spawning 3 isolates for one function.
 * @author iefremov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

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

  asyncStart();
  rport1.receive((message, replyTo){
    Expect.equals(-1, message);
    rport1.close();
    asyncEnd();
  });

  asyncStart();
  rport2.receive((message, replyTo){
    Expect.equals(-2, message);
    rport2.close();
    asyncEnd();
  });

  asyncStart();
  rport3.receive((message, replyTo){
    Expect.equals(-3, message);
    rport3.close();
    asyncEnd();
  });
}

