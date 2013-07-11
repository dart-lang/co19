/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SendPort spawnFunction(void topLevelFunction(), [bool unhandledExceptionCallback(IsolateUnhandledException e)])
 * Creates and spawns an isolate that shares the same code as the current
 * isolate, but that starts from [topLevelFunction].
 * @description Checks that an isolate can be spawned from a newly spawned isolate.
 * @author iefremov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

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

  asyncStart();
  port.receive((message, replyTo){
    if("fdone" == message) {
      replyTo.send("g!", port.toSendPort());
      return;
    }
    Expect.equals("ok", message);
    port.close();
    asyncEnd();
  });
}
