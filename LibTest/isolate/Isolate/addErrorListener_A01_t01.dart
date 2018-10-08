/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addErrorListener(
 *                      SendPort port
 *            )
 * Requests that uncaught errors of the isolate are sent back to port.
 *
 * The errors are sent back as two elements lists. The first element is
 * a String representation of the error, usually created by calling toString
 * on the error. The second element is a String representation of
 * an accompanying stack trace, or null if no stack trace was provided.
 * To convert this back to a StackTrace object, use StackTrace.fromString.
 *
 * @description Check that uncaught errors of the isolate are sent to the given
 * listener.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  ErrorServer server = await ErrorServer.spawn(errorsAreFatal:false);

  server.generateError();
  server.generateError();
  await new Future.delayed(ONE_SECOND); // wait for errors to be discarded

  ReceivePort errorPort = new ReceivePort();
  server.isolate.addErrorListener(errorPort.sendPort);

  int count = 2;
  server.generateError();
  await for (var error in errorPort) {
    //print(error);
    Expect.isTrue(count < 7, "received unexpected data: $error");
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
