/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E reduce(E combine(E previousValue, E element))
 * Reduces a collection to a single value by iteratively combining elements of
 * the collection using the provided function.
 * @description Checks that the returned value is correct.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<double> list, double expected) {
  var l = new Float64List.fromList(list);
  var res = l.reduce((prev, cur) => prev + cur);
  Expect.equals(expected, res);
}

checkConst(List<double> list, double expected) {
  Float64List l = new Float64List.fromList(list);
  var res = l.reduce((prev, cur) => 1.0);
  Expect.equals(expected, res);
}

main() {
  check([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0], 55.0);
  check([10.0, -1.0, -2.0, -3.0, -4.0], 0.0);

  checkConst([1.0, 2.0, 3.0], 1.0);
}
