/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamController.broadcast({void onListen(), void onCancel(),
 *                                       bool sync: false})
 * A controller where stream can be listened to more than once.
 *
 * The Stream returned by stream is a broadcast stream. It can be listened to
 * more than once.
 *
 * The controller distributes any events to all currently subscribed listeners
 * at the time when add, addError or close is called.
 *
 * @description Checks that the controller distributes all data and error
 * events to all currently subscribed listeners.
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

check(List events) {
  StreamController controller = new StreamController.broadcast();
  Stream s = controller.stream;
  List expectedData = events.where((e) => !(e is num) || e >= 0).toList();
  List expectedErrors = events.where((e) => e is num && e < 0).toList();

  asyncMultiStart(2);

  List events1 = [], errors1 = [];
  s.listen(
    (event) => events1.add(event),
    onError: (error) => errors1.add(error),
    onDone: () {
      Expect.listEquals(expectedData, events1);
      Expect.listEquals(expectedErrors, errors1);
      asyncEnd();
    }
  );


  List events2 = [], errors2 = [];
  s.listen(
      (event) => events2.add(event),
      onError: (error) => errors2.add(error),
      onDone: () {
        Expect.listEquals(expectedData, events2);
        Expect.listEquals(expectedErrors, errors2);
        asyncEnd();
      }
  );

  for (var event in events) {
    if (event is num && event < 0) {
      controller.addError(event);
    } else {
      controller.add(event);
    }
  }
  controller.close();
}

main() {
  check([]);
  check([1, 2, null, []]);
  check([1, 2, -1, "aaa", -3, 10]);
  check([-1, -2, -1, -3, -10]);
  check([-1, 1, -2, 2, "hello", "world", -10]);
}
