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
 * inside the starting function of the isolate was thrown.
 * @author kaigorodov
 * @issue 10012
 */

import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

var message0="1";

void main2() {
   throw message0;
}

bool unhandledExceptionCallback(IsolateUnhandledException e){
print("child unhandledExceptionCallback $e");
  port.receive((message, replyTo) {
print("child port.receive $message $replyTo");
    replyTo.send(e.source);
    port.close();
  });
  return true;
}

main() {
  SendPort send_port = spawnFunction(main2, unhandledExceptionCallback);
  send_port.send(message0, port.toSendPort());
  
  asyncStart();
  port.receive((message2, replyTo){
print("main port.receive $message2 $replyTo");
    asyncEnd();
    Expect.equals(message0, message2);
    port.close();
  });
}
