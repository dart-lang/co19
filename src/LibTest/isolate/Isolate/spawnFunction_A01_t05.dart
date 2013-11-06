/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SendPort spawnFunction(void topLevelFunction(), [bool unhandledExceptionCallback(IsolateUnhandledException e)])
 * Creates and spawns an isolate that shares the same code as the current
 * isolate, but that starts from [topLevelFunction].
 * @description Checks that sending multiple messages works fine.
 * @author iefremov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

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

  asyncStart();
  port.receive((message, replyTo){
    if(message != "end") {
      asyncStart();
      Expect.equals(++i, message);
      replyTo.send(i, port.toSendPort());
    } else {
      port.close();
    }
    asyncEnd();
  });
}
