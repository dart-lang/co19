/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates and spawns an isolate whose code is available at uri. Like with
 * spawnFunction, the child isolate will have a default ReceivePort, and this
 * function returns a SendPort derived from it.
 * @description Checks that chained spawning of 10 isolates works properly.
 * @author iefremov
 */

import "dart:isolate";

main() {
  SendPort send_port = spawnUri("spawnUri_A01_t04_isolate.dart");
  send_port.send(1, port.toSendPort());

  port.receive((message, replyTo){
    Expect.equals(10, message);
    port.close();
  });
}
