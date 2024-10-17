// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void addErrorSync( Object error, [ StackTrace? stackTrace ])
/// Adds and delivers an error event.
///
/// Adds an error like [addError] and attempts to deliver it immediately.
/// Delivery can be delayed if other previously added events are still pending
/// delivery, if the subscription is paused, or if the subscription isn't
/// listening yet.
///
/// @description Checks that this method sends an error event and a stack trace.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

StackTrace st = StackTrace.fromString("Stack trace");

main() {
  asyncStart(2);
  var stream = Stream<int>.multi((controller) {
    controller.add(1);
    controller.addErrorSync(2, st);
    controller.add(3);
    controller.close();
  });
  listen(stream);
  listen(stream);
}

void listen(Stream<int> stream) {
  int i = 1;
  bool delivered = false;
  stream.listen((v) {
    Expect.equals(i, v);
    i += 2;
  }, onError: (e, _st) {
    delivered = true;
    Expect.equals("Stack trace", _st.toString());
  }, onDone: () {
    Expect.isTrue(delivered);
    asyncEnd();
  });
}
