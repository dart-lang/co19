/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion IsolateSink streamSpawnFunction(void topLevelFunction(), [bool unhandledExceptionCallback(IsolateUnhandledException e)])
 * The optional unhandledExceptionCallback argument is invoked whenever an exception inside the isolate is unhandled.
 * It can be seen as a big try/catch around everything that is executed inside the isolate.
 * The callback should return true when it was able to handled the exception.
 * @description Checks that the function spawns the isolate that executes the
 * specified top-level function. Also checks that  the returned IsolateSink
 * is actually bound to the child's default Stream available from the top-level getter.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

SendPort replyTo=null;

void readMsg(message) {
  if (replyTo==null) {
    Expect.isTrue(message is SendPort);
    replyTo=message;
  } else {
    throw message;
  }
}

void main2() {
  stream.listen(readMsg);
}

bool unhandledExceptionCallback(IsolateUnhandledException e){
  replyTo.send(e.source);
  port.close();
  return true;
}

main() {
  var message0="2";
  IsolateSink sink = streamSpawnFunction(main2, unhandledExceptionCallback);
  sink.add(port.toSendPort());
  sink.add(message0);

  asyncStart();
  port.receive((message, replyTo){
    Expect.equals(message0, message);
    port.close();
    asyncEnd();
  });
}


