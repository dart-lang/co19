/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int8List.fromList(List<int> elements)
 * Creates a [Int8List] with the same length as the [elements] list and copies
 * over the elements.
 * @description Checks that a new [Int8List] has the same size and elements as
 * the [elements].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";
import "../toInt8.lib.dart";

void check(List<int> array) {
  Int8List l = new Int8List.fromList(array);
  Expect.equals(l.length, array.length);
  Expect.listEquals(array.map(toInt8).toList(), l);
}

main() {
  check([]);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]);
  check([127, -128]);
  check([1000, 1000, 1000]);
}
