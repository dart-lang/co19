// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion @Since("2.5")
///   Stream<T>.value( T value )
/// Creates a stream which emits a single data event before closing.
///
/// This stream emits a single data event of value and then closes with a done
/// event.
///
/// @description Checks that the `Stream.value()` constructor creates a stream
/// which emits a single data event before closing.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  int counter = 0;
  asyncStart();
  Stream stream = Stream.value("Stream.value");
  stream.listen((v) {
    counter++;
    Expect.equals("Stream.value", v);
  }, onDone: () {
    Expect.equals(1, counter);
    asyncEnd();
  });
}
