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
/// @description Checks that it is not an error if run-time type of the
/// `iterable` elements is an integer
/// @author sgrekhov22@gmail.com

import "dart:typed_data";
import "../../../Utils/expect.dart";

void main() {
  Uint64List uint64List = Uint64List.fromList([0xFFFFFFFFFFFFFFFF, 1]);
  Int32List int32List = Int32List(2);
  int32List.setRange(0, 2, uint64List);
  Expect.listEquals([-1, 1], int32List);
}
