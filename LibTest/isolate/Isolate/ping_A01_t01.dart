/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void ping(
 *      SendPort responsePort, {
 *      Object response,
 *      int priority: IMMEDIATE
 * })
 *    Request that the isolate send response on the responsePort.
 *    If the isolate is alive, it will eventually send response (defaulting
 * to null) on the response port.
 *
 * @description Check that isolate sends response null after ping() call with
 * only response port as argument. The isolate is continuously running.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:math";
import "../../../Utils/expect.dart";

entryPoint(message){
  Random random = new Random();
  int s = 0;
  while (true){
    s = -s + random.nextInt(100);
  }
}

test() async {
  ReceivePort onExit = new ReceivePort();
  Isolate isolate = await Isolate.spawn(
      entryPoint,
      null, // message
      onExit:onExit.sendPort,
      errorsAreFatal:true
  );
  // check
  ReceivePort pingPort = new ReceivePort();
  isolate.ping(pingPort.sendPort);
  Expect.isNull(await pingPort.first);
  // clean up
  isolate.kill(priority:Isolate.immediate);
  await onExit.first;
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
