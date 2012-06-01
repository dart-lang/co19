/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates and spawns an isolate whose code is available at uri. Like with
 * spawnFunction, the child isolate will have a default ReceivePort, and this
 * function returns a SendPort derived from it.
 * @description Checks that sending multiple messages works fine.
 * @author iefremov
 */

#import("dart:isolate");


main() {
  SendPort send_port = spawnUri("spawnUri_A01_t05_isolate.dart");
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
