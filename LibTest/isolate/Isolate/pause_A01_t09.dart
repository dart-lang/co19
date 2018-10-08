/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
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
 * @description Check that paused isolate enqueue timer events and handles
 * them after resume.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "dart:isolate";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

void entryPoint(SendPort sendPort) {
  new Future.delayed(ONE_SECOND, () { sendPort.send("timer 1"); });
  new Future.delayed(TWO_SECONDS, () { sendPort.send("timer 2"); });
  new Future.delayed(new Duration(milliseconds:100),
      () {
        sendPort.send("activated");
      }
  );
}

test() async {
  Isolate isolate;
  List receivedData = [];
  Capability resumeCapability;
  ReceivePort receivePort = new ReceivePort();
  receivePort.listen(
    (data){
      if ("activated"==data) {
        resumeCapability = isolate.pause();
      }
      receivedData.add(data);
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
  isolate.resume(resumeCapability);
  await onExit.first;
  receivePort.close();
  Expect.listEquals(["activated", "timer 1", "timer 2"], receivedData);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
