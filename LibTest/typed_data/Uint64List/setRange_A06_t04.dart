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
/// `iterable` is not subtype of this list. Test elements of a larger size
/// @author sgrekhov22@gmail.com

import "dart:typed_data";
import "../../../Utils/expect.dart";

void main() {
  var floats =
      Float64x2List.fromList([Float64x2(1.1, 2.2), Float64x2(3.3, 4.4)]);
  Uint64List uint64List = Uint64List(2);
  Expect.throws(() {
    (uint64List as dynamic).setRange(0, 2, floats);
  });
}
