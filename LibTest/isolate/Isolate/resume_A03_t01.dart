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
 * ...
 *    The capability must be one returned by a call to pause on this isolate,
 * otherwise the resume call does nothing.
 *
 * @description Check that resume(null) does nothing on isolate that is
 * not paused
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

  server.isolate.resume(null);
  Expect.equals("resume", await server.ping("resume"));

  Expect.equals("server", await server.ping("server"));

  await server.stop();
  receivePort.close();
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
