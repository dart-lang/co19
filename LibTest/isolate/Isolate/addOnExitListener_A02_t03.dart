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
 * Different values for parameter response are specified. Check that only last
 * used value is used.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "dart:math";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

Future test(List<Object> values) async {
  ErrorServer server = await ErrorServer.spawn(errorsAreFatal:false);
  ReceivePort onExit = new ReceivePort();
  List events = [];
  onExit.listen(
    (data) {
      events.add(data);
    }
  );
  for (Object value in values) {
    server.isolate.addOnExitListener(onExit.sendPort, response:value);
  }
  server.requestStop();
  await new Future.delayed(TWO_SECONDS); // wait for duplicate events
  onExit.close();
  Expect.listEquals([values.last], events);
}

main() {
  asyncStart();
  List<Object> values = [
    null, true, false, "string", 10, 1.1, double.nan, double.infinity
  ];
  Random random = new Random();
  Future.wait([
    test(new List.from(values..shuffle(random))),
    test(new List.from(values..shuffle(random))),
    test(new List.from(values..shuffle(random))),
    test(new List.from(values..shuffle(random))),
    test(new List.from(values..shuffle(random))),
    test(new List.from(values..shuffle(random))),
    test(new List.from(values..shuffle(random))),
    test(new List.from(values..shuffle(random)))
  ]).then((_) => asyncEnd());
}
