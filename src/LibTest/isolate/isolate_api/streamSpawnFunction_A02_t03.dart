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
 * @description Checks that the function passed as the second parameter is invoked when an unhandled exception
 * inside a callback function of the isolate was thrown.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

var message0="2";

Sync2 sync=new Sync2((var message, SendPort replyTo) {
  replyTo.send(message);
});

bool unhandledExceptionCallback(IsolateUnhandledException e){
  sync.put1(e.source);
  return true;
}

void main2() {
  stream.listen((message) {
    sync.put2(message as SendPort);
  });
  runLater(() {
    throw message0;
  });
}

main() {
  IsolateSink sink = streamSpawnFunction(main2, unhandledExceptionCallback);
  sink.add(port.toSendPort());

  bool received=false;

  port.receive((message, replyTo){
    received=true;
  print ("port.receive($message)");
    Expect.equals(message0, message);
    port.close();
  });
  
  runLater(() {
    Expect.isTrue(received, "unhandledExceptionCallback not called");
  }, 200);
}


