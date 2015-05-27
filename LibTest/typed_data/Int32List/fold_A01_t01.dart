/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic fold(initialValue, combine(previousValue, E element))
 * Reduces a collection to a single value by iteratively combining each
 * element of the collection with an existing value using the provided function.
 * Use initialValue as the initial value, and the function combine
 * to create a new value from the previous one and an element.
 * @description Checks that the returned value is correct.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

checkInt(list, expected) {
  var l = new Int32List.fromList(list);
  var res = l.fold(0, (prev, cur) => prev + cur);
  Expect.equals(expected, res);
}

checkString(list, expected) {
  var l = new Int32List.fromList(list);
  var res = l.fold("", (prev, cur) => "${prev}${cur}");
  Expect.equals(expected, res);
}

checkConst(list, expected) {
  var l = new Int32List.fromList(list);
  var res = l.fold(0, (prev, cur) => 1);
  Expect.equals(expected, res);
}


main() {
  checkInt([], 0);
  checkInt([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 55);
  checkInt([10, -1, -2, -3, -4], 0);

  checkString([], "");
  checkString([1], "1");
  checkString([1, 2, 3, 4, 5], "12345");

  checkConst([], 0);
  checkConst([1, 2, 3], 1);
}
