/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream errors
 *   Returns a broadcast stream of uncaught errors from the isolate.
 *   Each error is provided as an error event on the stream.
 *   The actual error object and stackTraces will not necessarily be the same
 * object types as in the actual isolate, but they will always have the same
 * Object.toString result.
 *   This stream is based on addErrorListener and removeErrorListener.
 *
 * @description Check that each error in isolate is provided as an error event
 * on the errors stream
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void entryPoint(SendPort sendPort) {
  ReceivePort receivePort = new ReceivePort();
  dynamic i = 1;
  receivePort.listen(
    (x) {
      if (x == "!stop") {
        receivePort.close();
      } else {
        var z = "a" + i++; // intentional error
      }
    }
  );
  sendPort.send(receivePort.sendPort);
}


test() async {
  ReceivePort receivePort = new ReceivePort();
  ReceivePort onExitPort = new ReceivePort();
  Isolate isolate = await Isolate.spawn(
                                    entryPoint,
                                    receivePort.sendPort,
                                    errorsAreFatal:false,
                                    onExit: onExitPort.sendPort);
  SendPort sendPort = await receivePort.first;
  // subscribe to isolate errors
  List receivedErrors = [];
  StreamSubscription ss1 = isolate.errors.listen(
    (data) { receivedErrors.add(data); },
    onError: (e) { receivedErrors.add(e); }
  );
  // produce errors
  for (String s in ["hello", "world", ":-)", "!stop"]) {
    sendPort.send(s);
  }
  // clean up
  await onExitPort.first;
  ss1.cancel();
  Expect.equals(3, receivedErrors.length);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
