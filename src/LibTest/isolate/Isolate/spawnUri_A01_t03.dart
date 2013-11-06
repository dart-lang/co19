/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates and spawns an isolate whose code is available at uri. Like with
 * spawnFunction, the child isolate will have a default ReceivePort, and this
 * function returns a SendPort derived from it.
 * @description Checks that an isolate can be spawned from a newly spawned isolate.
 * @author iefremov
 * @issue 5222
 */
import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

main() {
  SendPort send_port = spawnUri("spawnUri_A01_t03_isolate1.dart");
  send_port.send("isolate1", port.toSendPort());
  asyncStart();
  port.receive((message, replyTo){
    if("isolate1_done" == message) {
      replyTo.send("isolate2", port.toSendPort());
      return;
    }
    Expect.equals("ok", message);
    port.close();
    asyncEnd();
  });
}
