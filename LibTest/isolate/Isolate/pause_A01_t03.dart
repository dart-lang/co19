/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Capability pause([
 *    Capability resumeCapability
 * ])
 *    Requests the isolate to pause.
 *    When the isolate receives the pause command, it stops processing events
 * from the event loop queue. It may still add new events to the queue in
 * response to, e.g., timers or receive-port messages. When the isolate is
 * resumed, it handles the already enqueued events.
 *
 * @description Check that isolate does not handle timer events after pause()
 * call.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "IsolateUtil.dart";

void entryPoint(SendPort sendPort) {
  new Future.delayed(ONE_SECOND, () { sendPort.send("from timer 1"); });
  new Future.delayed(TWO_SECONDS, () { sendPort.send("from timer 2"); });
  sendPort.send("activated");
}

test() async {
  bool additionalData = false;
  Isolate isolate;
  ReceivePort receivePort = new ReceivePort();
  receivePort.listen(
    (data){
      if ("activated"==data) {
        isolate.pause();
      } else {
        print(data);
        additionalData = true;
      }
    }
  );
  ReceivePort onExit = new ReceivePort();
  isolate = await Isolate.spawn(
                                entryPoint,
                                receivePort.sendPort,
                                onExit:onExit.sendPort
                              );
  await new Future.delayed(THREE_SECONDS);
// clean up & check
  isolate.kill(priority:Isolate.IMMEDIATE);
  await onExit.first;
  receivePort.close();
  Expect.isFalse(additionalData);
  receivePort.close();
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
