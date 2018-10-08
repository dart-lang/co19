/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32List.fromList(List<double> elements)
 * Creates a [Float32List] with the same length as the [elements] list
 * and copies over the elements.
 * @description Checks that an instance of Float32List is created.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<double> array) {
  Float32List l = new Float32List.fromList(array);
  Expect.isTrue(l is Float32List);
}

main() {
  check([]);
  check([3.4028234663852886e38, 1.401298464324817e-45, 1.1754943508222875e-38]);
  check([2e-10, 2e-10, 2e-10]);
  check([
    0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0,
    13.0, 14.0, 15.0, 16.0, 17.0
  ]);
}
