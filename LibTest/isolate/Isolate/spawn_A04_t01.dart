/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the errorAreFatal, onExit and/or onError parameters are
 * provided, the isolate will act as if, respectively, setErrorsFatal,
 * addOnExitListener and addErrorListener were called with the corresponding
 * parameter and was processed before the isolate starts running.
 *
 * @description Check that with errorAreFatal set to true the isolate is
 * terminated on first error. The isolate is active.
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

void entryPoint(SendPort sendPort) {
  // this may awake the isolate from suspended state, caused by error
  new Future.delayed(TWO_SECONDS).then(
      (_) {
        sendPort.send("finish");
      }
  );
  sendPort.send("hello");
  // An error that should stop the isolate
  dynamic i = 1;
  sendPort.send(", " + i); /// static type warning
  sendPort.send("world");
}

test() async {
  ReceivePort receivePort = new ReceivePort();
  Future<List> receivedData = receivePort.toList();

  Isolate isolate = await Isolate.spawn(entryPoint,
                                        receivePort.sendPort,
                                        errorsAreFatal:true);
  await new Future.delayed(ONE_SECOND);

  Expect.equals("timeout", await ping(isolate, "ping", THREE_SECONDS));
  receivePort.close();
  Expect.listEquals(["hello"], await receivedData);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
