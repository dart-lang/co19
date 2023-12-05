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
  Int8List int8List = Int8List.fromList([-127, 127]);
  Int16List int16List = Int16List.fromList([-1024, 1024]);
  Uint8List uint8list = Uint8List(2);
  uint8list.setRange(0, 2, int8List);
  Expect.listEquals([129, 127], uint8list);
  uint8list.setRange(0, 2, int16List);
  Expect.listEquals([0, 0], uint8list);
}
