/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SendPort spawnFunction(void topLevelFunction(), [bool unhandledExceptionCallback(IsolateUnhandledException e)])
 * The [topLevelFunction] argument must be a static top-level function
 * or a static method that takes no arguments. It is illegal to pass a function closure.
 * @needsreview documentation looks incomplete: what happens if a closure is passed?
 * Currently vm does not throw an error, only prints a message.
 * @description Attempt to pass a closure. Check that the spawned isolate does not reply. 
 * @author kaigorodov
 */

import "dart:async";
import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  void f() {
    port.receive((message, replyTo) {
      Expect.equals("alex", message);
      replyTo.send("justas");
      port.close();
    });
  }
  SendPort send_port = spawnFunction(f);

  send_port.send("alex", port.toSendPort());

  var replied=false;
  // we expect no reply, so do not raise asyncStart();
  port.receive((message, replyTo){
    replied=true;
    Expect.equals("justas", message);
    port.close();
  });

  asyncStart();
  new Timer(durationMs(100), () {
    asyncEnd();
    Expect.isFalse(replied);
    port.close();
  });

}
