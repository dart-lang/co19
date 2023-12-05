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
  Uint8List uint8List = Uint8List.fromList([255, 1]);
  Uint16List uint16List = Uint16List.fromList([0xFFFF, 2]);
  Int8List int8list = Int8List(2);
  int8list.setRange(0, 2, uint8List);
  Expect.listEquals([-1, 1], int8list);
  int8list.setRange(0, 2, uint16List);
  Expect.listEquals([-1, 2], int8list);
}
