/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E lastWhere(bool test(E element), {E orElse()}))
 * Returns the last element that satisfies the given predicate [test].
 * @description Checks that the last element that satisfies the given predicate
 * is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Uint8ClampedList.fromList([1, 2, 3, 4, 5, 6, 9]);
  var res = l.lastWhere((element) => element == 1);
  Expect.equals(1, res);

  res = l.lastWhere((element) => element > 6);
  Expect.equals(9, res);

  res = l.lastWhere((element) => element > 1);
  Expect.equals(9, res);
}
