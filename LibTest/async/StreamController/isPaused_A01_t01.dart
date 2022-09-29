// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion bool isPaused
/// Whether the subscription would need to buffer events.
/// This is the case if the controller's stream has a listener and it is paused,
/// or if it has not received a listener yet. In that case, the controller is
/// considered paused as well.
/// A broadcast stream controller is never considered paused.
///
/// @description Checks that if the controller's stream has a listener and it is
/// paused, isPaused returns true.

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller = new StreamController();
  List events1 = [];
  StreamSubscription ss = controller.stream.listen(
      (event) {events1.add(event);}
  );
  ss.pause();
  Expect.isTrue(controller.isPaused);

  controller.close();
}
