/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T fold<T>(T initialValue, T combine(T previousValue, E element))
 * Reduces a collection to a single value by iteratively combining each element
 * of the collection with an existing value.
 * Uses initialValue as the initial value, then iterates through the elements
 * and updates the value with each element using the combine function,
 * @description Checks that the correct value is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

checkDouble(List<Float64x2> list, double expected) {
  var l = new Float64x2List.fromList(list);
  var res = l.fold(0, (prev, cur) => prev + cur.x + cur.y);
  Expect.equals(expected, res);
}

checkString(List<Float64x2> list, String expected) {
  var l = new Float64x2List.fromList(list);
  var res = l.fold("res", (prev, cur) => "${prev} ${cur.x + cur.y}");
  Expect.equals(expected, res);
}

checkConst(List<Float64x2> list, int expected) {
  var l = new Float64x2List.fromList(list);
  var res = l.fold(0, (prev, cur) => 11);
  Expect.equals(expected, res);
}

main() {
  checkDouble([], 0.0);
  checkDouble([f64x2(1.0), f64x2(2.0)], 6.0);
  checkDouble([f64x2(1.0), f64x2(3.0), f64x2(5.0), f64x2(7.0), f64x2(9.0)],
      50.0);

  checkString([], "res");
  checkString([f64x2(1.0), f64x2(2.0)], "res 2.0 4.0");
  checkString([f64x2(1.0), f64x2(3.0), f64x2(5.0), f64x2(7.0), f64x2(9.0)],
      "res 2.0 6.0 10.0 14.0 18.0");

  checkConst([], 0);
  checkConst([f64x2(1.0), f64x2(2.0)], 11);
  checkConst([f64x2(1.0), f64x2(3.0), f64x2(5.0), f64x2(7.0), f64x2(9.0)], 11);
}
