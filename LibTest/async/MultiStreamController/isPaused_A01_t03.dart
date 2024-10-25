// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool get isPaused
/// Whether the subscription would need to buffer events.
///
/// This is the case if the controller's stream has a listener and it is paused,
/// or if it has not received a listener yet. In that case, the controller is
/// considered paused as well.
///
/// A broadcast stream controller is never considered paused. It always forwards
/// its events to all uncanceled subscriptions, if any, and let the
/// subscriptions handle their own pausing and buffering.
///
/// @description Checks that this getter returns `true` if the stream is paused
/// and `false` otherwise.
/// @author sgrekhov22@gmail.com
/// @issue 56915

import "dart:async";
import "../../../Utils/expect.dart";

var theController;

main() {
  asyncStart();
  var stream = Stream<int>.multi((controller) {
    theController = controller;
    Expect.isFalse(controller.isPaused);
    controller.add(1);
    controller.add(2);
    controller.add(3);
    controller.close();
  });
  listen(stream);
}

void listen(Stream<int> stream) {
  late StreamSubscription ss;
  ss = stream.listen((v) {
    if (v == 1) {
      ss.pause(Future.delayed(Duration(milliseconds: 100)));
    } else {
      // Looks strange, but it is expected.
      // See https://github.com/dart-lang/sdk/issues/56915 for more details.
      Expect.isTrue(theController.isPaused);
    }
  }, onDone: asyncEnd);
}
