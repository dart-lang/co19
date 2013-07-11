/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SendPort spawnFunction(void topLevelFunction(), [bool unhandledExceptionCallback(IsolateUnhandledException e)])
 * When any isolate starts (even the main script of the application),
 * a default ReceivePort is created for it.
 * This port is available from the top-level getter port defined in this library.
 * spawnFunction returns a SendPort derived from the child isolate's default port.
 * @description Checks that a SendPort returned by spawnFunction correstonds to the default port of the isolate.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

void duplicator() {
  port.receive((message, replyTo) {
    replyTo.send([message, message]);
    port.close();
  });
}

void check(var value) {
  SendPort send_port = spawnFunction(duplicator);
  ReceivePort rPort = new ReceivePort();
  send_port.send(value, rPort);

  asyncStart();
  rPort.receive((message, replyTo){
    Expect.isTrue(message is List);
    List ml=message as List;
    Expect.equals(2, ml.length);
    Expect.equals(value, ml[0]);
    Expect.equals(value, ml[1]);
    asyncEnd();
    rPort.close();
  });
}

main() {
  check(null);
  check("");
  check("alex");
  check(true);
  check(1);
}