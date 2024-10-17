// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void closeSync()
/// Closes the controller and delivers a done event.
///
/// Closes the controller like close and attempts to deliver a "done" event
/// immediately. Delivery can be delayed if other previously added events are
/// still pending delivery, if the subscription is paused, or if the
/// subscription isn't listening yet. If it's necessary to know whether the
/// "done" event has been delivered, done future will complete when that has
/// happened.
///
/// @description Checks that [done] future completes after `closeSync()` call.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart(2);
  var stream = Stream<int>.multi((controller) {
    bool done = false;
    controller.done.then((_) {
      done = true;
      asyncEnd();
    });
    controller.add(1);
    controller.add(2);
    controller.add(3);
    Expect.isFalse(done);
    controller.closeSync();
  });
  listen(stream);
  listen(stream);
}

void listen(Stream<int> stream) {
  int i = 0;
  stream.listen((v) {
    Expect.equals(++i, v);
  }, onDone: () {
    Expect.equals(3, i);
  });
}
