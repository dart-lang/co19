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
 * @description Checks that unhandledExceptionCallback is invoked when an error occur in topLevelFunction.
 * @issue #10012
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

var message0="2";
SendPort replyTo=null;
var invoked;

void checkReply() {
  if ((replyTo!=null) && (invoked!=null)) {
    replyTo.send(invoked);
  }  
}

bool unhandledExceptionCallback(IsolateUnhandledException e){
  print ("unhandledExceptionCallback($invoked)");
  invoked=e.source;
  checkReply();
  return true;
}

void main2() {
  stream.listen((message) {
    print ("main2.readMsg($message)");
    replyTo=(message as SendPort);
    checkReply();
  });
  throw message0;
}

main() {
  IsolateSink sink = streamSpawnFunction(main2, unhandledExceptionCallback);
  sink.add(port.toSendPort());

  asyncStart();
  port.receive((message, replyTo){
    print ("port.receive($message)");
    Expect.equals(message0, message);
    port.close();
    asyncEnd();
  });
}


