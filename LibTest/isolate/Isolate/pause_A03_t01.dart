/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Capability pause([
 *    Capability resumeCapability
 * ])
 * ...
 *   If an isolate is paused more than once using the same capability, only one
 * resume with that capability is needed to end the pause.
 *
 * @description Check that if an isolate is paused more than once using the
 * same capability, only one resume with that capability is needed to end
 * the pause.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "dart:isolate";
import "IsolateUtil.dart";
import "../../../Utils/expect.dart";

Future test() async {
  ReceivePort receivePort = new ReceivePort();
  Future<List> receivedData = receivePort.toList();
  EchoServer server = await EchoServer.spawn(receivePort.sendPort);
  server.send("before pause");
  Capability resumeCapability = new Capability();
  server.isolate.pause(resumeCapability);
  server.isolate.pause(resumeCapability);
  server.isolate.pause(resumeCapability);
  server.isolate.pause(resumeCapability);
  server.send("paused");
  server.isolate.resume(resumeCapability);
  server.send("resumed");
  await server.stop();
  receivePort.close();
  Expect.listEquals(["before pause", "paused", "resumed"], await receivedData);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
