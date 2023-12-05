// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// void setRange(
///   int start,
///   int end,
///   Iterable<E> iterable, [
///   int skipCount = 0
/// ])
///
/// @description Checks that it is a run time error if run-time type of the
/// `iterable` elements is not a subtype of `Int8`
/// @author sgrekhov22@gmail.com

import "dart:typed_data";
import "../../../Utils/expect.dart";

void main() {
  var floats = Float32List.fromList([1, 2, 3, 4]);
  Uint8List uint8list = Uint8List(4);
  Expect.throws(() {
    (uint8list as dynamic).setRange(0, 4, floats);
  });
}
