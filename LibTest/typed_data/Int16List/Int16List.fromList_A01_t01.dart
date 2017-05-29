/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int16List.fromList(List<int> elements)
 * Creates a [Int16List] with the same length as the [elements] list and copies
 * over the elements.
 * @description Checks that an instance of Int16List is created.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> array) {
  Int16List l = new Int16List.fromList(array);
  Expect.isTrue(l is Int16List);
}

main() {
  check([]);
  check([32767, -32768]);
  check([1000, 1000, 1000]);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]);
}
