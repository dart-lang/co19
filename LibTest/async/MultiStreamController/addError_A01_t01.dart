// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void addError( Object error, [ StackTrace? stackTrace ])
/// Sends or enqueues an error event.
///
/// @description Checks that this method sends an error event.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart(2);
  var stream = Stream<int>.multi((controller) {
    controller.add(1);
    controller.addError(2);
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
  }, onError: (e) {
    delivered = true;
    Expect.equals(2, e);
  }, onDone: () {
    Expect.isTrue(delivered);
    asyncEnd();
  });
}
