/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Each isolate has its own heap, which means that all values in memory,
 * including globals, are available only to that isolate.
 * @description Checks that each isolate gets their own copy of global and static variables.
 * @author iefremov
 */

import "dart:isolate";

class A {
  static var statik = "statik";
}

var global = "global";


f() {
  port.receive((message, replyTo) {
    global = "f";
    A.statik = "f";
    replyTo.send([global, A.statik]);
    port.close();
  });
}

main() {
  SendPort send_port = spawnFunction(f);
  send_port.send("", port.toSendPort());

  port.receive((message, replyTo){
    Expect.equals("f", message[0]);
    Expect.equals("f", message[1]);
    Expect.equals("global", global);
    Expect.equals("statik", A.statik);
    port.close();
  });
}

