/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addOnExitListener(
 *                    SendPort responsePort, {
 *                    Object response
 *            })
 *    Asks the isolate to send response on responsePort when it terminates.
 *    The isolate will send a response message on responsePort as the last
 * thing before it terminates. It will run no further code after the message
 * has been sent.
 *
 * @description Check that several listeners can be added and each receive
 * given response when isolate terminates.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  ErrorServer server = await ErrorServer.spawn(errorsAreFatal:false);

  List<Object> expectedResponses = [
    null, null,
    true, false,
    0, 1, -1, 1024,
    "a", "ABC",
    1.1, 0.0, double.nan
  ];

  ReceivePort onExit = new ReceivePort();
  List<Future<Object>> actualResponses = [onExit.first];
  server.isolate.addOnExitListener(onExit.sendPort);

  for (Object r in expectedResponses.skip(1)){
    ReceivePort p = new ReceivePort();
    actualResponses.add(p.first);
    server.isolate.addOnExitListener(p.sendPort, response:r);
  }

  server.requestStop();

  Expect.listEquals(expectedResponses, await Future.wait(actualResponses));
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
