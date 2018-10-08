/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addErrorListener(
 *                      SendPort port
 *            )
 * ...
 * Listening using the same port more than once does nothing. It will only
 * get each error once.
 *
 * @description Check that listening using the same port more than once only
 * get each error once
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  ErrorServer server = await ErrorServer.spawn(errorsAreFatal:false);

  ReceivePort errorPort = new ReceivePort();
  server.isolate.addErrorListener(errorPort.sendPort);
  server.isolate.addErrorListener(errorPort.sendPort);
  server.isolate.addErrorListener(errorPort.sendPort);

  int count = 0;
  server.generateError();
  await for (var error in errorPort) {
    Expect.isTrue(count < 5, "received unexpected data: $error");
    Expect.isTrue(error is List);
    Expect.equals(2, error.length);
    Expect.isTrue(error[0] is String);
    Expect.isTrue(error[1] is String);
    Expect.equals(count.toString(), error[0]);
    count++;

    if (count == 5) {
      server.requestStop();
      // wait for any unexpected events on errorPort
      new Future.delayed(TWO_SECONDS, () => errorPort.close());
    } else {
      server.generateError();
    }
  }
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
