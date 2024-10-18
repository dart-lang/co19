// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool get isClosed
/// Whether the stream controller is closed for adding more events.
///
/// The controller becomes closed by calling the [close] method. New events
/// cannot be added, by calling [add] or [addError], to a closed controller.
///
/// If the controller is closed, the "done" event might not have been delivered
/// yet, but it has been scheduled, and it is too late to add more events.
///
/// @description Checks that this getter returns `true` if the stream is closed
/// and `false` otherwise.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart(2);
  var stream = Stream<int>.multi((controller) {
    Expect.isFalse(controller.isClosed);
    controller.add(1);
    controller.add(2);
    controller.add(3);
    controller.close().then((_) {
      Expect.isTrue(controller.isClosed);
      asyncEnd();
    });
  });
  listen(stream);
  listen(stream);
}

void listen(Stream<int> stream) {
  int i = 1;
  stream.listen((v) {
    Expect.equals(i++, v);
  });
}
