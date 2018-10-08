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
 * affected. Checks that paused listener will buffer events internally.
 * @author a.semenov@unipro.ru
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller = new StreamController.broadcast();
  Stream stream = controller.stream;
  asyncMultiStart(2);
  List log1 = [];
  StreamSubscription sub1 = stream.listen(
    (event) => log1.add(event),
    onDone: () {
      Expect.listEquals([1,2,3,4,5], log1);
      asyncEnd();
    }
  );

  List log2 = [];
  StreamSubscription sub2 = stream.listen(
    (event) => log2.add(event),
    onDone: () {
      Expect.listEquals([1,2,3,4,5], log2);
      asyncEnd();
    }
  );

  controller.add(1);
  controller.add(2);
  sub1.pause();
  controller.add(3);
  controller.add(4);
  sub1.resume();
  controller.add(5);
  controller.close();
}
