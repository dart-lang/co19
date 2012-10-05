/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

import "dart:isolate";

final MSG_NUM = 100;

main() {
  port.receive((message, replyTo) {
    if(message < MSG_NUM) {
      replyTo.send(message+1, port.toSendPort());
      return;
    }
    replyTo.send("end", port.toSendPort());
    port.close();
  });
}
