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
 * @description Check that isolate does not process events after pause() call.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "dart:isolate";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  ReceivePort receivePort = new ReceivePort();
  Future<List> receivedDataFuture = receivePort.toList();
  EchoServer server = await EchoServer.spawn(receivePort.sendPort);
  server.send("hello");
  await new Future.delayed(new Duration(milliseconds:100));
  server.isolate.pause();
  server.send("paused");
  server.send("server");
  await new Future.delayed(new Duration(milliseconds:200));
// clean up & check
  await server.kill(priority:Isolate.immediate);
  receivePort.close();
  // first message hello may be blocked by pause call
  List receivedData = await receivedDataFuture;
  Expect.isTrue(receivedData.length==0 ||
    (receivedData.length==1 && "hello"==receivedData[0]));
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
