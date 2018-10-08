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
 * @description Check that call to resume() with freshly created capability
 * does nothing on isolate that is paused
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

Duration _500MS = new Duration(milliseconds:500);

test() async {
  ReceivePort receivePort = new ReceivePort();
  EchoServer server = await EchoServer.spawn(receivePort.sendPort);

  Expect.equals("hello", await server.ping("hello"));

  server.isolate.pause();
  Expect.equals("timeout", await server.ping("paused", _500MS, "timeout"));

  server.isolate.resume(new Capability());
  Expect.equals("timeout", await server.ping("resume", _500MS, "timeout"));

  await server.kill(priority:Isolate.immediate);
  receivePort.close();
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
