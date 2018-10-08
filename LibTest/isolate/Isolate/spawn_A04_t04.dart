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
 * only suspended on any error. The isolate is active.
 * @issue #26652
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

void entryPoint(SendPort sendPort) {
  dynamic i1 = 1, i2 = 2, i3 = 3, i4 = 4;

  new Future.delayed(ONE_SECOND).then(
     (_) {
        sendPort.send("second");
        // An error that should stop the isolate
        sendPort.send(", " + i2);
        sendPort.send("attempt");
     }
  );
  new Future.delayed(TWO_SECONDS).then(
     (_) {
        sendPort.send("third");
        // An error that should stop the isolate
        sendPort.send(", " + i3);
        sendPort.send("attempt");
     }
  );
  new Future.delayed(THREE_SECONDS).then(
     (_) {
        sendPort.send("finish");
        // An error that should stop the isolate
        sendPort.send(", " + i4);
        sendPort.send("attempt");
     }
  );
  sendPort.send("hello");
  // An error that should stop the isolate
  sendPort.send(", " + i1);
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
    Expect.equals("ping", await ping(isolate, "ping", THREE_SECONDS));
    if (data == "finish") {
      receivePort.close();
      Expect.listEquals(["hello","second","third","finish"], receivedData);
      asyncEnd();
    }
  }
}

main() {
  asyncStart();
  test();
}
