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
import "../../../Utils/expect.dart";

checkInt(string, expected) {
  var runes = new Runes(string);
  var res = runes.fold(0, (prev, cur) => prev + cur);
  Expect.equals(expected, res);
}

checkString(string, expected) {
  var runes = new Runes(string);
  var res = runes.fold("", (prev, cur) => "${prev}${cur}");
  Expect.equals(expected, res);
}

checkConst(string, expected) {
  var runes = new Runes(string);
  var res = runes.fold(0, (prev, cur) => 1);
  Expect.equals(expected, res);
}


main() {
  checkInt('', 0);
  checkInt('\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a', 55);

  checkString('', '');
  checkString('a', '97');
  checkString('\x01\x02\x03\x04\x05', "12345");

  checkConst('', 0);
  checkConst('____', 1);
}
