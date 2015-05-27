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
  var l = new Float32List.fromList(list);
  var res = l.fold(0, (prev, cur) => prev + cur);
  Expect.equals(expected, res);
}

checkString(list, expected) {
  var l = new Float32List.fromList(list);
  var res = l.fold("", (prev, cur) => "${prev}${cur}");
  Expect.equals(expected, res);
}

checkConst(list, expected) {
  var l = new Float32List.fromList(list);
  var res = l.fold(0, (prev, cur) => 1);
  Expect.equals(expected, res);
}


main() {
  checkInt([], 0);
  checkInt([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0], 55.0);
  checkInt([10.0, -1.0, -2.0, -3.0, -4.0], 0.0);

  checkString([], "");
  checkString([1.0], "1.0");
  checkString([1.0, 2.0, 3.0, 4.0, 5.0], "1.02.03.04.05.0");

  checkConst([], 0);
  checkConst([1.0, 2.0, 3.0], 1);
}
