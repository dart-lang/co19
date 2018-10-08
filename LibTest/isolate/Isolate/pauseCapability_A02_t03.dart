/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Capability pauseCapability
 *    read-only
 *    Capability granting the ability to pause the isolate.
 *    This capability is used by pause. If the capability is not the correct
 * pause capability of the isolate, including if the capability is null,
 * then calls to pause will have no effect.
 *
 * @description Check that if pauseCapability is correct pause capability,
 * call to pause() without arguments pauses the isolate, call to resume()
 * resumes the isolate.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  ReceivePort receivePort = new ReceivePort();
  EchoServer server = await EchoServer.spawn(receivePort.sendPort);
  Isolate isolate = new Isolate(server.isolate.controlPort,
                                 pauseCapability:server.isolate.pauseCapability,
                                 terminateCapability:null);
  Expect.equals("hello", await server.ping("hello"));
  Capability resumeCapability = isolate.pause();
  Expect.equals("timeout", await server.ping("pause1", ONE_SECOND, "timeout"));
  isolate.resume(resumeCapability);
  Expect.equals("server", await server.ping("server"));

  // clean up
  await server.stop();
  receivePort.close();
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
