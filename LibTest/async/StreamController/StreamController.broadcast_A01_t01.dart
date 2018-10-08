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
 * @description Checks that the controller distributes all events to all
 * currently subscribed listeners.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

check(List events0) {
  StreamController controller = new StreamController.broadcast();
  Stream s = controller.stream;

  List events1 = new List();
  StreamSubscription ss1 = s.listen((event) {events1.add(event);});
  asyncStart();
  ss1.onDone(() {
    Expect.listEquals(events0, events1);
    asyncEnd();
  });

  List events2 = new List();
  StreamSubscription ss2 = s.listen((event) {events2.add(event);});
  asyncStart();
  ss2.onDone(() {
    Expect.listEquals(events0, events2);
    asyncEnd();
  });

  for (var event in events0) {
    controller.add(event);
  }
  controller.close();
}

main() {
  check([]);
  check([1, 2, null, []]);
}
