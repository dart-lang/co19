/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SendPort spawnFunction(void topLevelFunction(), [bool unhandledExceptionCallback(IsolateUnhandledException e)])
 * Creates and spawns an isolate that shares the same code as the current
 * isolate, but that starts from [topLevelFunction].
 * @description Checks that chained spawning of 10 isolates works properly.
 * @author iefremov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

f() {
  port.receive((message, replyTo) {
    if(message < 10) {
      SendPort send_port = spawnFunction(f);
      send_port.send(message+1, replyTo);
    } else {
      replyTo.send(10, null);
    }
    port.close();
  });
}

main() {
  SendPort send_port = spawnFunction(f);
  send_port.send(1, port.toSendPort());

  asyncStart();
  port.receive((message, replyTo){
    Expect.equals(10, message);
    port.close();
    asyncEnd();
  });
}
