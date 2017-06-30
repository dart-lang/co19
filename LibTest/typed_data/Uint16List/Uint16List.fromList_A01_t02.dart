/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uint16List.fromList(List<int> list)
 * Creates a [Uint16List] with the same length as the [elements] list and copies
 * over the elements.
 * @description Checks that a new [Uint16List] has the same length and values as
 * the [elements].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> array) {
  Uint16List l = new Uint16List.fromList(array);
  Expect.equals(l.length, array.length);
  Expect.listEquals(array, l);
}

main() {
  check([]);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]);
  check([32768, 65535]);
  check([1000, 1000, 1000]);
}
