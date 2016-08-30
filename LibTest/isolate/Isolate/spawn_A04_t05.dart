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
 * only suspended on any error. The isolate is passive.
 * @static-warning
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

void entryPoint(List message) {
  SendPort sendPort = message[1];
  ReceivePort receivePort = new ReceivePort();
  receivePort.listen(
     (data) {
        sendPort.send(data);
        // An error that should suspend the isolate
        sendPort.send(", "+1); /// static type warning
        sendPort.send("hello");
     }
  );
  message[0].send(receivePort.sendPort);
}

test() async {
  ReceivePort controlPort = new ReceivePort();
  ReceivePort receivePort = new ReceivePort();

  Isolate isolate = await Isolate.spawn(entryPoint,
                                  [controlPort.sendPort, receivePort.sendPort],
                                   errorsAreFatal:false);
  SendPort sendPort = await controlPort.first;

  int i = 0;
  List receivedData = [];
  sendPort.send(i++);
  await for (var data in receivePort) {
    receivedData.add(data);
    Expect.equals("ping", await ping(isolate, "ping", THREE_SECONDS));
    if (i < 5) {
      sendPort.send(i++);
    } else {
      receivePort.close();
      Expect.listEquals([0, 1, 2, 3, 4], receivedData);
      asyncEnd();
    }
  }
}

main() {
  asyncStart();
  test();
}
