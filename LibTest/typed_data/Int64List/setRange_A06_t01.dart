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
  Uint32List uint32List = Uint32List.fromList([0xFFFFFFFF, 1]);
  Uint64List uint64List = Uint64List.fromList([0xFFFFFFFFFFFFFFFF, 2]);
  Int64List int64List = Int64List(2);
  int64List.setRange(0, 2, uint32List);
  Expect.listEquals([4294967295, 1], int64List);
  int64List.setRange(0, 2, uint64List);
  Expect.listEquals([-1, 2], int64List);
}
