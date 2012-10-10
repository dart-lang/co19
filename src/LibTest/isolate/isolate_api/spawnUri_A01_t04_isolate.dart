/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

library spawnUri_A01_t04_isolate;
import "dart:isolate";

main() {
  port.receive((message, replyTo) {
    if(message < 10) {
      SendPort send_port = spawnUri("spawnUri_A01_t04_isolate.dart");
      send_port.send(message+1, replyTo);
    } else {
      replyTo.send(10, null);
    }
    port.close();
  });
}
