/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic lastWhere(bool test(E element), {Object orElse()})
 * Returns the last element that satisfies the given predicate [test].
 * @description Checks that the last element that satisfies
 * the given predicate is returned.
 * @author msyabro
 */
import "../../../Utils/expect.dart";


main() {
  var runes = new Runes('\x01\x02\x03\x04\x05\x06\x09');
  var res = runes.lastWhere((element) => element == 1);
  Expect.equals(1, res);

  res = runes.lastWhere((element) => element > 6);
  Expect.equals(9, res);

  res = runes.lastWhere((element) => element > 1);
  Expect.equals(9, res);
}
