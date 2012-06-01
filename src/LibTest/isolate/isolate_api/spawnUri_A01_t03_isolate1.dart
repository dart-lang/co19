/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

#library("spawnUri_A01_t03_isolate1");
#import("dart:isolate");

main() {
  port.receive((message, replyTo) {
    Expect.equals("isolate1", message);
    SendPort sport = spawnUri("spawnUri_A01_t03_isolate2.dart");
    replyTo.send("isolate1_done", sport);
    port.close();
  });
}