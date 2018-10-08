/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Capability terminateCapability
 *    read-only
 *    Capability granting the ability to terminate the isolate.
 *    This capability is used by kill and setErrorsFatal. If the capability
 * is not the correct termination capability of the isolate, including
 * if the capability is null, then calls to those methods will have no effect.
 *
 * @description Check that if terminateCapability is not correct, calls
 * to kill() have no effect.
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
                                  pauseCapability:null,
                                  terminateCapability:wrongCapability);
  Expect.equals("hello", await server.ping("hello"));
  isolate.kill();
  Expect.equals("alive1", await ping(isolate, "alive1"));
  isolate.kill(priority:Isolate.immediate);
  Expect.equals("alive2", await ping(isolate, "alive2"));
  isolate.kill(priority:Isolate.beforeNextEvent);
  Expect.equals("alive3", await ping(isolate, "alive3"));

  // clean up
  await server.stop();
  receivePort.close();
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
