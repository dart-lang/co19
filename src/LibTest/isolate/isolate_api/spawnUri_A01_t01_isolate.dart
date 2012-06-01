/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

#library("spawnUri_A01_t01_isolate");
#import("dart:isolate");

main() {
  port.receive((message, replyTo) {
    Expect.equals("go!", message);
    replyTo.send("ok!");
    port.close();
  });
}