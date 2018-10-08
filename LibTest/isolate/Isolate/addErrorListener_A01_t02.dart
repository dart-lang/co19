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
 * @description Check that StackTrace.fromString() accepts a String
 * representation of an accompanying stack trace
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  ErrorServer server = await ErrorServer.spawn(errorsAreFatal:false);

  ReceivePort errorPort = new ReceivePort();
  server.isolate.addErrorListener(errorPort.sendPort);

  int count = 0;
  server.generateError();
  await for (var error in errorPort) {
    Expect.isTrue(count < 5, "received unexpected data: $error");
    Expect.isTrue(error is List);
    Expect.equals(2, error.length);
    Expect.isTrue(error[0] is String);
    Expect.isTrue(error[1] is String);
    if (error[1]!=null){
      Expect.isNotNull(new StackTrace.fromString(error[1]));
    }
    count++;

    if (count == 5) {
      break;
    }
    server.generateError();
  }
  await server.stop();
  errorPort.close();
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
