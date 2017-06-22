/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uint8ClampedList.fromList(List<num> list)
 * Creates a [Uint8ClampedList] with the same size as the [elements] list
 * and copies over the values clamping when needed.
 * @description Checks that an instance of Uint8ClampedList is created.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> array) {
  Uint8ClampedList l = new Uint8ClampedList.fromList(array);
  Expect.isTrue(l is Uint8ClampedList);
}

main() {
  check([]);
  check([255, 128]);
  check([1000, 1000, 1000]);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]);
}
