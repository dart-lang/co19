/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void resume(
 *                    Capability resumeCapability
 *                    )
 *    Resumes a paused isolate.
 *    Sends a message to an isolate requesting that it ends a pause that was
 * requested using the resumeCapability.
 *
 * @description Check that event queue is processed after call to resume()
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  ReceivePort receivePort = new ReceivePort();
  EchoServer server = await EchoServer.spawn(receivePort.sendPort);

  Expect.equals("hello", await server.ping("hello"));

  Capability resumeCapability = server.isolate.pause();
  Expect.equals("timeout", await server.ping("paused", ONE_SECOND, "timeout"));

  server.isolate.resume(resumeCapability);
  Expect.equals("server", await server.ping("server"));

  await server.stop();
  receivePort.close();
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
