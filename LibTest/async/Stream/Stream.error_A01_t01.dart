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
/// @description Checks that `Stream.error()` constructor creates a stream which
/// emits a single error event before completing.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() async {
  Stream stream1 = Stream.error("Stream.error");
  try {
    await for (var x in stream1) {
      Expect.fail("Unexpected event $x");
    }
  } catch (e) {
    Expect.equals("Stream.error", e);
  }

  Stream stream2 = Stream.error("Stream.error");
  try {
    await stream2.isEmpty;
    Expect.fail("Expected an error");
  } catch (e) {
    Expect.equals("Stream.error", e);
  }
}
