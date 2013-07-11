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
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

var message0="2";
SendPort replyTo=null;

bool unhandledExceptionCallback(IsolateUnhandledException e){
  var invoked=e.source;
  print ("unhandledExceptionCallback($invoked)");
  stream.listen((message) {
//  print ("readMsg($message)");
    (message as SendPort).send(invoked);
    port.close();
  });
  return true;
}

void main2() {
  throw message0;
}

main() {
  IsolateSink sink = streamSpawnFunction(main2, unhandledExceptionCallback);
  sink.add(port.toSendPort());

  bool received=false;

  asyncStart();
  port.receive((message, replyTo){
    received=true;
  //print ("port.receive($message)");
    Expect.equals(message0, message);
    port.close();
    asyncEnd();
  });
  
  runLater(() {
    if (received) return;
    Expect.isTrue(received, "unhandledExceptionCallback not called");
  }, 200);
}


