/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the paused parameter is set to true, the isolate will start up
 * in a paused state, as if by an initial call of
 * isolate.pause(isolate.pauseCapability). To resume the isolate,
 * call isolate.resume(isolate.pauseCapability).
 *
 * @description Check that paused parameter with value true cause isolate to
 * start up in a paused state, i.e. isolate entry function is not executed
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";

void entryPoint(SendPort sendPort) {
  sendPort.send("hello"); // should not be executed
}

test() async {
  bool testPassed = true;
  ReceivePort receivePort = new ReceivePort();
  receivePort.listen((_) => testPassed = false);
  await Isolate.spawn(entryPoint, receivePort.sendPort, paused: true);
  await new Future.delayed(new Duration(seconds:2));
  if (testPassed){
    asyncEnd();
  }
  receivePort.close();
}

main() {
  asyncStart();
  test();
}
