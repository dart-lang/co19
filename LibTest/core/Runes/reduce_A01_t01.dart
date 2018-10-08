/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E reduce(E combine(E previousValue, E element))
 * Reduces a collection to a single value by iteratively combining
 * elements of the collection using the provided function.
 * @description Checks that the returned value is correct.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

check(string, expected) {
  var runes = new Runes(string);
  var res = runes.reduce((prev, cur) => prev + cur);
  Expect.equals(expected, res);
}

checkConst(string, expected) {
  var runes = new Runes(string);
  var res = runes.reduce((prev, cur) => 1);
  Expect.equals(expected, res);
}

main() {
  check('\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a', 55);
  check('word', 444);

  checkConst('~~~', 1);
}
