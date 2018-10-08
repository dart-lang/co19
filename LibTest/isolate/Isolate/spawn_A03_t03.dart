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
 * @description Check that paused isolate (started with parameter paused
 * equal to true) is resumed by call to isolate.pause(isolate.pauseCapability)
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";

void entryPoint(SendPort sendPort) {
  sendPort.send("response");
}

test() async {
  bool paused = true;
  ReceivePort receivePort = new ReceivePort();
  receivePort.listen(
      (data) {
        Expect.isFalse(paused, "Isolate should not be in paused state");
        Expect.equals("response", data);
        asyncEnd();
        receivePort.close();
      }
  );
  Isolate isolate = await Isolate.spawn(entryPoint, receivePort.sendPort, paused: true);
  await new Future.delayed(new Duration(seconds:1));
  paused = false;
  isolate.resume(isolate.pauseCapability);
}

main() {
  asyncStart();
  test();
}
