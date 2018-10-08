/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int32List.fromList(List<int> elements)
 * Creates a [Int32List] with the same length as the [elements] list and copies
 * over the elements.
 * @description Checks that an instance of Int32List is created.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> array) {
  Int32List l = new Int32List.fromList(array);
  Expect.isTrue(l is Int32List);
}

main() {
  check([]);
  check([2147483647, -2147483648]);
  check([1000, 1000, 1000]);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]);
}
