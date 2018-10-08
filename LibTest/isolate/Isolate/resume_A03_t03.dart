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
 * @description Check that resume(null) does nothing on isolate that started in
 * paused state
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
  ReceivePort receivePort = new ReceivePort();
  Future<Object> receiveFuture = receivePort.first;
  Isolate isolate = await Isolate.spawn(
                                      entryPoint,
                                      receivePort.sendPort,
                                      paused: true);
  isolate.resume(null);
  Expect.equals("timeout", await receiveFuture.timeout(ONE_SECOND,
                                                      onTimeout:()=>"timeout"));
  receivePort.close();
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
