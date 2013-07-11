/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SendPort spawnFunction(void topLevelFunction(), [bool unhandledExceptionCallback(IsolateUnhandledException e)])
 * Creates and spawns an isolate that shares the same code as the current
 * isolate, but that starts from [topLevelFunction].
 * @description Checks that the function spawns the isolate that executes the
 * specified top-level function. Also checks that the default ReceivePort
 * is available from the top-level getter and that the returned SendPort
 * is actually bound to the child default ReceivePort.
 * @author iefremov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

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

  asyncStart();
  port.receive((message, replyTo){
    Expect.equals("justas", message);
    port.close();
    asyncEnd();
  });
}

