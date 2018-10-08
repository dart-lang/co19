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
 * @description Check that with errorAreFatal set to false the isolate is
 * only suspended on first error. The isolate is active.
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

void entryPoint(SendPort sendPort) {
  dynamic i = 1;

  // this should awake the isolate from suspended state, caused by error
  new Future.delayed(TWO_SECONDS).then(
      (_) {
        sendPort.send("finish");
      }
  );
  sendPort.send("hello");
  // An error that should stop the isolate
  sendPort.send(", " + i);
  sendPort.send("world");
}

test() async {
  ReceivePort receivePort = new ReceivePort();

  Isolate isolate = await Isolate.spawn(entryPoint,
                                        receivePort.sendPort,
                                        errorsAreFatal:false);
  List receivedData = [];
  await for (var data in receivePort) {
    receivedData.add(data);
    if (data == "hello") {
      Expect.equals("ping", await ping(isolate, "ping", THREE_SECONDS));
    } else if (data == "finish") {
      receivePort.close();
      Expect.listEquals(["hello","finish"], receivedData);
      asyncEnd();
    }
  }
}

main() {
  asyncStart();
  test();
}
