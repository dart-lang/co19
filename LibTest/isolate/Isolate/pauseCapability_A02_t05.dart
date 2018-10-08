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
 *    If the isolate is started in a paused state, use this capability
 * as argument to resume to resume the isolate.
 *
 * @description Check that if pauseCapability is not correct pause capability,
 * call to resume() with pauseCapability as argument will not resume
 * the isolate, which is started in paused state.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

void entryPoint(SendPort sendPort) {
  sendPort.send("hello");
}

Future test(Capability pauseCapability) async {
  ReceivePort receivePort = new ReceivePort();
  Future<Object> receiveFuture = receivePort.first;
  Isolate isolate = await Isolate.spawn(entryPoint,
                                        receivePort.sendPort,
                                        paused:true);

  Isolate clone = new Isolate(isolate.controlPort,
                              pauseCapability:pauseCapability,
                              terminateCapability:null);

  clone.resume(clone.pauseCapability);

  var timeout = receiveFuture.timeout(ONE_SECOND, onTimeout:() => "timeout");
  Expect.equals("timeout", await timeout);

  isolate.resume(isolate.pauseCapability);
  receivePort.close();
  return null;
}

main() {
  asyncStart();
  Future.wait(
      [test(null), test(new Capability())]
  ).then(
      (_) => asyncEnd()
  );
}
