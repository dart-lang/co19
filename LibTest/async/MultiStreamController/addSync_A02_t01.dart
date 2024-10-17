// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void addSync( T value )
/// Adds and delivers an event.
///
/// Adds an event like [add] and attempts to deliver it immediately. Delivery
/// can be delayed if other previously added events are still pending delivery,
/// if the subscription is paused, or if the subscription isn't listening yet.
///
/// @description Checks that delivery can be delayed if subscription is paused.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart(2);
  var stream = Stream<int>.multi((controller) {
    controller.addSync(1);
    controller.addSync(2);
    controller.addSync(3);
    controller.close();
  });
  listen(stream);
  listen(stream);
}

void listen(Stream<int> stream) {
  int i = 0;
  StreamSubscription ss = stream.listen((v) {
    Expect.equals(++i, v);
  }, onDone: () {
    Expect.equals(3, i);
    asyncEnd();
  });
  ss.pause(Future<void>.delayed(Duration(milliseconds: 100), () {
    ss.resume();
  }));
}
