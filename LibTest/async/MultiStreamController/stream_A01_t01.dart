// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Stream<T> get stream
/// The stream that this controller is controlling.
///
/// @description Checks that the [MultiStreamController] does not support
/// reading its [StreamController.stream].
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart(2);
  late Stream<int> stream;
  stream = Stream<int>.multi((controller) {
    Expect.throws(() {
      controller.stream;
    });
    controller.add(1);
    controller.add(2);
    controller.add(3);
    Expect.throws(() {
      controller.stream;
    });
    controller.close();
  });
  listen(stream);
  listen(stream);
}

void listen(Stream<int> stream) {
  int i = 0;
  stream.listen((v) {
    Expect.equals(++i, v);
  }, onDone: asyncEnd);
}
