/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion IsolateSink streamSpawnFunction(void topLevelFunction(), [bool unhandledExceptionCallback(IsolateUnhandledException e)])
 * Creates and spawns an isolate that shares the same code as the current isolate, but that starts from topLevelFunction.
 * The topLevelFunction argument must be a static top-level function or a static method that takes no arguments.
 * When any isolate starts (even the main script of the application), a default IsolateStream
 * is created for it. This sink is available from the top-level getter stream defined in this library.
 * spawnFunction returns an IsolateSink feeding into the child isolate's default stream.
 * @description Checks that the function spawns the isolate that executes the
 * specified top-level function. Also checks that  the returned IsolateSink
 * is actually bound to the child's default Stream available from the top-level getter.
 * @author kaigorodov
 */

import "dart:async";
import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

SendPort replyTo=null;

void readMsg(message) {
  if (replyTo==null) {
    Expect.isTrue(message is SendPort);
    replyTo=message;
  } else {
    Expect.equals("alex", message);
    replyTo.send("justas");
  }
}

void main2() {
  stream.listen(readMsg);
}

main() {
  IsolateSink sink = streamSpawnFunction(main2);
  sink.add(port.toSendPort());
  sink.add("alex");

  asyncStart();
  port.receive((message, replyTo){
    Expect.equals("justas", message);
    port.close();
    asyncEnd();
  });
}

