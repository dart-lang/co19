/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Isolate> spawn(void entryPoint(message), message)
 * The argument entryPoint specifies the entry point of the spawned isolate.
 * It must be a static top-level function or a static method that takes no arguments.
 * It is not allowed to pass a function closure.
 * The entry-point function is invoked with the initial message.
 * Returns a future that will complete with an Isolate instance.
 * @description Attempt to pass a closure. Check that the spawned isolate does not reply. 
 * @needsreview issue #15234: documentation looks incomplete: what happens if a closure is passed?
 * Currently vm does not throw an error, only hangs. So the test is not executed - premature return is inserted.
 * @author kaigorodov
 */

import "dart:async";
import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  void f(SendPort replyPort) {
    replyPort.send("justas");
  }

  var receivePort = new ReceivePort();
  bool replied=false;
  
return;

  Isolate.spawn(f, receivePort.sendPort);
  receivePort.listen((message){
    replied=true;
    receivePort.close();
  });

  asyncStart();
  new Timer(durationMs(100), () {
    asyncEnd();
    Expect.isFalse(replied);
    receivePort.close();
  });

}
