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
 * Currently vm does not throw an error when spawn() is invoked, but the Future ends with an error.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";

main() {
  void f(SendPort replyPort) {
    replyPort.send("justas");
  }

  var receivePort = new ReceivePort();

  Isolate.spawn(f, receivePort.sendPort).then((v){
      receivePort.close();
      Expect.fail(" a closure spawned: $v)");
    }
    , onError: (e) {
      print("onError: $e");
      receivePort.close();
    }
  );
}
