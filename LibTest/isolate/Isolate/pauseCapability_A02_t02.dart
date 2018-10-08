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
 * @description Check that if pauseCapability is not correct pause capability,
 * calls to pause() have no effect.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  ReceivePort receivePort = new ReceivePort();
  EchoServer server = await EchoServer.spawn(receivePort.sendPort);
  Capability wrongCapability = new Capability();
  Isolate isolate = new Isolate(server.isolate.controlPort,
                                  pauseCapability:wrongCapability,
                                  terminateCapability:null);
  Expect.equals("hello", await server.ping("hello"));
  isolate.pause();
  Expect.equals("pause1", await server.ping("pause1"));
  isolate.pause(new Capability());
  Expect.equals("pause2", await server.ping("pause2"));
  isolate.pause(wrongCapability);
  Expect.equals("pause3", await server.ping("pause3"));

  // clean up
  await server.stop();
  receivePort.close();
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
