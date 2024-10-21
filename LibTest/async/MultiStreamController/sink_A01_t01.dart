// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion StreamSink<T> get sink
/// Returns a view of this object that only exposes the StreamSink interface.
///
/// @description Checks that this getter returns a view of this object that
/// exposes the StreamSink interface.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart(2);
  late Stream<int> stream;
  stream = Stream<int>.multi((controller) {
    Expect.isNotNull(controller.sink);
    controller.sink.add(1);
    controller.sink.add(2);
    controller.sink.add(3);
    controller.sink.close();
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
