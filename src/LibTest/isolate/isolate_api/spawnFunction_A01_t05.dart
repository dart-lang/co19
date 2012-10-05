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
 * @description Checks that sending multiple messages works fine.
 * @author iefremov
 */

import "dart:isolate";

final MSG_NUM = 100;

f() {
  port.receive((message, replyTo) {
    if(message < MSG_NUM) {
      replyTo.send(message+1, port.toSendPort());
      return;
    }
    replyTo.send("end", port.toSendPort());
    port.close();
  });
}

main() {
  SendPort send_port = spawnFunction(f);
  send_port.send(0, port.toSendPort());

  int i = 0;

  port.receive((message, replyTo){
    if(message != "end") {
      Expect.equals(++i, message);
      replyTo.send(i, port.toSendPort());
    } else {
      port.close();
    }
  });
}
