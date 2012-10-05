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
 * @description Checks that an isolate can be spawned from a newly spawned isolate.
 * @author iefremov
 */

import "dart:isolate";

g() {
  port.receive((message, replyTo) {
    Expect.equals("g!", message);
      replyTo.send("ok");
      port.close;
  });
}

f() {
  port.receive((message, replyTo) {
    Expect.equals("f!", message);
    SendPort sport = spawnFunction(g);
    replyTo.send("fdone", sport);
    port.close();
  });
}

main() {
  SendPort send_port = spawnFunction(f);
  send_port.send("f!", port.toSendPort());
  port.receive((message, replyTo){
    if("fdone" == message) {
      replyTo.send("g!", port.toSendPort());
      return;
    }
    Expect.equals("ok", message);
    port.close();
  });
}
