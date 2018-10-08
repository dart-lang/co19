/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E singleWhere(bool test(E element))
 * ...
 * Checks all elements to see if test(element) returns true. If exactly one
 * element satisfies test, that element is returned. Otherwise, if there are
 * no matching elements, or if there is more than one matching element, a
 * StateError is thrown.
 * @description Checks that a StateError is thrown, if there are no matching
 * elements, or if there is more than one matching element.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

listEquals(Float64x2List expected, Float64x2List actual) {
  Expect.equals(expected.length, actual.length);
  for (int i = 0; i < expected.length; ++i) {
    Expect.equals(expected[i].x, actual[i].x);
    Expect.equals(expected[i].y, actual[i].y);
  }
}

main() {
  var l = new Float64x2List.fromList([
    f64x2(1.0), f64x2(2.0), f64x2(2.0), f64x2(3.0), f64x2(4.0,), f64x2(5.0)
  ]);

  try {
    l.singleWhere((e) => e.x > 5.0);
    Expect.fail("State error is expected");
  } on StateError {}

  try {
    l.singleWhere((e) => e.y == 2.0);
    Expect.fail("State error is expected");
  } on StateError {}
}
