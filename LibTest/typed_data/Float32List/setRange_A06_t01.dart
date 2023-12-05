// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// void setRange(
///     int start,
///     int end,
///     Iterable<E> iterable, [
///     int skipCount = 0
/// ])
///
/// @description Checks that it is a run time error if run-time type of the
/// `iterable` is not subtype of this list. Test data of the same size
/// @author sgrekhov22@gmail.com

import "dart:typed_data";
import "../../../Utils/expect.dart";

void main() {
  List<num> ints = Uint32List.fromList([1, 2, 3, 4]);
  Float32List floats = Float32List(4);
  Expect.throws(() {
    // Check that it's no memcopy of the same-sized data
    (floats as List<num>).setRange(0, 4, ints);
  });
}
