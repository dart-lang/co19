// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void Function()? onPause
/// The callback which is called when the stream is paused.
///
/// May be set to `null`, in which case no callback will happen.
///
/// Pause related callbacks are not supported on broadcast stream controllers.
///
/// @description Checks that this callback is called when the stream is paused.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart(2);
  var stream = Stream<int>.multi((controller) {
    Expect.isNull(controller.onPause);
    controller.onPause = () {
      asyncEnd();
    };
    controller.add(1);
    controller.add(2);
    controller.add(3);
    controller.close();
  });
  listen(stream);
  listen(stream);
}

void listen(Stream<int> stream) {
  late StreamSubscription ss;
  ss = stream.listen((v) {
    ss.pause();
  });
}
