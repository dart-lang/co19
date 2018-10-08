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
 * @description Check that event queue is processed after call to resume() on
 * Isolate instance that was started in paused state
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

test() async {
  bool paused = true;
  ReceivePort receivePort = new ReceivePort();
  receivePort.listen(
    (data){
      Expect.isFalse(paused);
      receivePort.close();
      asyncEnd();
    }
  );
  Isolate isolate = await Isolate.spawn(
                                      entryPoint,
                                      receivePort.sendPort,
                                      paused: true);

  await new Future.delayed(ONE_SECOND);
  paused = false;
  isolate.resume(isolate.pauseCapability);
}

main() {
  asyncStart();
  test();
}