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
 * @description Check that paused isolate enqueue incoming events and handles
 * them after resume
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
  Capability resumeCapability = server.isolate.pause();
  server.send("paused");
  server.send("server");
  await new Future.delayed(new Duration(milliseconds:300));
  server.isolate.resume(resumeCapability);
  server.send("bye");
  await new Future.delayed(new Duration(milliseconds:100));
// clean up & check
  await server.stop();
  receivePort.close();
  Expect.listEquals(
      ["hello", "paused", "server", "bye"],
      await receivedDataFuture
  );
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
