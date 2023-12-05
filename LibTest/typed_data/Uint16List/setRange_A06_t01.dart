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
  Int8List int8List = Int8List.fromList([-1, 127]);
  Int16List int16List = Int16List.fromList([-32767, 1]);
  Int32List int32List = Int32List.fromList([0xFFFFFFFF, 2]);
  Uint16List uint16List = Uint16List(2);
  uint16List.setRange(0, 2, int8List);
  Expect.listEquals([65535, 127], uint16List);
  uint16List.setRange(0, 2, int16List);
  Expect.listEquals([32769, 1], uint16List);
  uint16List.setRange(0, 2, int32List);
  Expect.listEquals([65535, 2], uint16List);
}
