/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamController.broadcast({void onListen(), void onCancel(),
 *                                       bool sync: false})
 * Each listener subscription is handled independently, and if one pauses,
 * only the pausing listener is affected. A paused listener will buffer events
 * internally until unpaused or canceled.
 *
 * @description Checks that if a listener is paused, only that listener is
 * affected.
 * Checks that paused listener will buffer events internally.
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller = new StreamController.broadcast();
  Stream stream = controller.stream;

  bool event1seen = false;
  StreamSubscription sub1 = stream.listen((event) {event1seen = true;});
  sub1.pause();
  bool event2seen = false;
  StreamSubscription sub2 = stream.listen((event) {event2seen = true;});

  controller.add(1);

  runLater(() {
    Expect.isFalse(event1seen);
    Expect.isTrue(event2seen);
    sub1.resume();
    runLater(() {
      Expect.isTrue(event1seen);
      controller.close();
    });
  });
}
