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
 * and updates the value with each element using the combine function.
 * @description Checks that the returned value is correct.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4p(n) => new Int32x4(n, n + 1, n + 2, n + 3);

void checkInt(List<Int32x4> list, int expected) {
  var l = new Int32x4List.fromList(list);
  var res = l.fold(0, (prev, cur) => prev + cur.x);
  Expect.equals(expected, res);
}

void checkString(List<Int32x4> list, String expected) {
  var l = new Int32x4List.fromList(list);
  var res = l.fold("yz", (prev, cur) => "${prev}${cur.y}${cur.z}");
  Expect.equals(expected, res);
}

void checkConst(List<Int32x4> list, int expected) {
  var l = new Int32x4List.fromList(list);
  var res = l.fold(2, (prev, cur) => 1);
  Expect.equals(expected, res);
}

main() {
  checkInt([], 0);
  checkInt([i32x4p(1)], 1);
  checkInt([i32x4p(1), i32x4p(5), i32x4p(9), i32x4p(13)], 28);

  checkString([], "yz");
  checkString([i32x4p(1)], "yz23");
  checkString([i32x4p(1), i32x4p(5), i32x4p(9), i32x4p(13)], "yz236710111415");

  checkConst([], 2);
  checkConst([i32x4p(2)], 1);
  checkConst([i32x4p(1), i32x4p(5), i32x4p(9), i32x4p(13)], 1);
}
