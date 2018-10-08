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
 * @description Check that paused parameter with value false cause isolate to
 * start up normally
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/expect.dart";

void entryPoint(SendPort sendPort) {
  sendPort.send("response");
}

main() {
  asyncStart();
  ReceivePort receivePort = new ReceivePort();
  receivePort.listen((_) {
    asyncEnd();
    receivePort.close();
  });
  Isolate.spawn(entryPoint, receivePort.sendPort, paused: false);
}
