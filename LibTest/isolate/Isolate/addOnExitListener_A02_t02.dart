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
 *   Adding the same port more than once will only cause it to receive one
 * message, using the last response value that was added.
 *
 * @description Check that isolate sends single event on responsePort,
 * which is supplied several times to addOnExitListener() of the same isolate.
 * Always the same value for parameter response is specified.
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
  server.isolate.addOnExitListener(onExit.sendPort, response:value);
  server.isolate.addOnExitListener(onExit.sendPort, response:value);
  server.isolate.addOnExitListener(onExit.sendPort, response:value);
  server.requestStop();
  await new Future.delayed(TWO_SECONDS); // wait for duplicate events
  onExit.close();
  Expect.listEquals([value], events);
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
