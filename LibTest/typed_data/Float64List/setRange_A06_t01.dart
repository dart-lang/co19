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
/// `iterable` is not subtype of this list. Test list elements of the same size
/// @author sgrekhov22@gmail.com
/// @issue 53945

import "dart:typed_data";
import "../../../Utils/expect.dart";

void main() {
  List<num> ints = Uint64List.fromList([1, 2, 3, 4]);
  Float64List floats = Float64List(4);
  Expect.throws(() {
    // Check that it's no memcopy of the same-sized data
    (floats as List<num>).setRange(0, 4, ints);
  });
}
