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
/// and `false` otherwise. Test a paused listener.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  var controllers = <MultiStreamController<int>>[];
  var stream = Stream<int>.multi((controller) {
    controllers.add(controller);
    Expect.isFalse(controller.isClosed);
    controller.add(1);
    controller.add(2);
  });
  listen(stream);
  listen(stream);
  Future.delayed(Duration(milliseconds: 200), () {
    controllers.forEach((c) {
      Expect.isFalse(c.isClosed);
    });
    asyncEnd();
  });
}

void listen(Stream<int> stream) {
  late StreamSubscription ss;
  ss = stream.listen((v) {
    ss.pause();
  });
}
