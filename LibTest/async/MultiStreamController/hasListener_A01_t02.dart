// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool get hasListener
/// Whether there is a subscriber on the [Stream].
///
/// @description Checks that this getter returns `true` if there is a subscriber
/// on the stream and `false` otherwise.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart(2);
  var stream = Stream<int>.multi((controller) {
    Expect.isTrue(controller.hasListener);
    controller.add(1);
    controller.add(2);
    controller.done.then((_) {
      Expect.isFalse(controller.hasListener);
      asyncEnd();
    });
  });
  listen(stream);
  listen(stream);
}

void listen(Stream<int> stream) {
  late StreamSubscription ss;
  ss = stream.listen((v) {
    ss.cancel();
  });
}
