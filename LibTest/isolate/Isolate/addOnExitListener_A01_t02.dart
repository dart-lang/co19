/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
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
 * @description Check that isolate sends given response value on responsePort,
 * when it terminates.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

Future test(Object value) async {
  ErrorServer server = await ErrorServer.spawn(errorsAreFatal:false);
  ReceivePort onExit = new ReceivePort();
  onExit.listen(
    (data) {
      onExit.close();
      Expect.equals(value, data);
    }
  );
  server.isolate.addOnExitListener(onExit.sendPort, response:value);
  server.requestStop();
}

main() {
  asyncStart();
  Future.wait([
    test(null),
    test(true),
    test(false),
    test("string"),
    test(10),
    test(1.1),
    test(double.nan),
    test(double.infinity)
  ]).then((_) => asyncEnd());
}
