/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int64List.fromList(List<int> list)
 * Creates a [Int64List] with the same size as the [elements] list
 * and copies over the elements.
 * @description Checks that a new [Int64List] has the same size and elements as
 * the [elements].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> array) {
  Int64List l = new Int64List.fromList(array);
  Expect.equals(l.length, array.length);
  Expect.listEquals(array, l);
}

main() {
  check([]);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]);
  check([9223372036854775807, -9223372036854775808]);
  check([1000, 1000, 1000]);
}
