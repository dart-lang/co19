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
/// @description Checks that it is not an error if run-time type of the
/// `iterable` elements is an integer
/// @author sgrekhov22@gmail.com

import "dart:typed_data";
import "../../../Utils/expect.dart";

void main() {
  Int32List int32List = Int32List.fromList([0xFFFFFFFF, 1]);
  Int64List int64List = Int64List.fromList([0xFFFFFFFFFFFFFFFF, 2]);
  Uint64List uint64List = Uint64List(2);
  uint64List.setRange(0, 2, int32List);
  Expect.listEquals([-1, 1], uint64List);
  uint64List.setRange(0, 2, int64List);
  Expect.listEquals([-1, 2], uint64List);
}
