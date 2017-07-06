/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T fold<T>(T initialValue, T combine(previousValue, E element))
 * Reduces a collection to a single value by iteratively combining each
 * element of the collection with an existing value.
 * Uses initialValue as the initial value, then iterates through the elements
 * and updates the value with each element using the combine function
 * @description Checks that the returned value is correct.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

checkInt(List<Float32x4> list, int expected) {
  var l = new Float32x4List.fromList(list);
  var res = l.fold(0, (prev, cur) => prev + cur.x + cur.y + cur.z + cur.w);
  Expect.equals(expected, res);
}

checkString(List<Float32x4> list, String expected) {
  var l = new Float32x4List.fromList(list);
  var res = l.fold("", (prev, cur) => "${prev}${cur.w + cur.z}");
  Expect.equals(expected, res);
}

checkConst(List<Float32x4> list, int expected) {
  var l = new Float32x4List.fromList(list);
  var res = l.fold(0, (prev, cur) => 1);
  Expect.equals(expected, res);
}


main() {
  checkInt([], 0);
  checkInt([
    pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
    pack(7.0), pack(8.0), pack(9.0), pack(10.0)
  ], 220);
  checkInt([pack(10.0), pack(-1.0), pack(-2.0), pack(-3.0), pack(-4.0)], 0);

  checkString([], "");
  checkString([pack(1.0)], "2.0");
  checkString([pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0)],
      "2.04.06.08.010.0");

  checkConst([], 0);
  checkConst([pack(1.0), pack(2.0), pack(3.0)], 1);
}
