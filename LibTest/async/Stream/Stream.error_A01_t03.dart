// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion @Since("2.5")
///   Stream<T>.error( Object error, [ StackTrace? stackTrace ])
///
/// Creates a stream which emits a single error event before completing.
///
/// This stream emits a single error event of `error` and `stackTrace` and then
/// completes with a done event.
///
/// @description Checks that the `Stream.error()` constructor creates a stream
/// which emits a single error event and then calls 'onDone'.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var onErrors = 0;
  asyncStart();
  Stream stream = Stream.error("Stream.error");
  stream.listen((v) {
    Expect.fail("Unexpected event $v");
  }, onError: (e) {
    onErrors++;
    Expect.equals("Stream.error", e);
  }, onDone: () {
    Expect.equals(onErrors, 1);
    asyncEnd();
  });
}
