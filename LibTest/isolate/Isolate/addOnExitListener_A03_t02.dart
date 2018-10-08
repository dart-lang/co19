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
 * ...
 *   If the isolate is already dead, no message will be sent.
 *
 * @description Check that dead isolate does not send events on responsePort.
 * Parameter response is specified.
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
  List events = [];
  onExit.listen(
      (data) {
        events.add(data);
      }
  );
  await server.stop();
  server.isolate.addOnExitListener(onExit.sendPort, response:value);
  await new Future.delayed(TWO_SECONDS);
  onExit.close();
  Expect.listEquals([], events);
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
