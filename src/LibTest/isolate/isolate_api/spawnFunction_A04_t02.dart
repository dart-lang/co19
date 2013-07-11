/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SendPort spawnFunction(void topLevelFunction(), [bool unhandledExceptionCallback(IsolateUnhandledException e)])
 * The optional unhandledExceptionCallback argument is invoked whenever an exception inside the isolate is unhandled.
 * It can be seen as a big try/catch around everything that is executed inside the isolate.
 * The callback should return true when it was able to handled the exception.
 * @description Checks that the function passed as the second parameter is invoked when an unhandled exception
 * inside a callback function the isolate was thrown.
 * @runtimeerror
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

var sender;

void err() {
  port.receive((message, replyTo) {
    sender=replyTo;
    throw message;
  });
}

bool unhandledExceptionCallback(IsolateUnhandledException e){
  sender.send(e.source);
  port.close();
  return true;
}

main() {
  var message0="1";
  SendPort send_port = spawnFunction(err, unhandledExceptionCallback);
  send_port.send(message0, port.toSendPort());

  asyncStart();
  port.receive((message2, replyTo){
    asyncEnd();
    Expect.equals(message0, message2);
    port.close();
  });
}