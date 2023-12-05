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
  Int8List int8List = Int8List.fromList([-1, 1]);
  Int16List int16List = Int16List.fromList([-2, 300]);
  Uint8ClampedList uint8ClampedList = Uint8ClampedList(2);
  uint8ClampedList.setRange(0, 2, int8List);
  Expect.listEquals([0, 1], uint8ClampedList);
  uint8ClampedList.setRange(0, 2, int16List);
  Expect.listEquals([0, 255], uint8ClampedList);
}
