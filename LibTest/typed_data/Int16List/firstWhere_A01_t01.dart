/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E firstWhere(bool test(E element), {Object orElse()})
 * Returns the first element that satisfies the given predicate [test].
 * @description Checks that the first element that satisfies the given predicate
 * is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";


main() {
  var l = new Int16List.fromList([1, 2, 3, 4, 5, 6, 9]);
  var res = l.firstWhere((element) => element == 1);
  Expect.equals(1, res);

  res = l.firstWhere((element) => element > 6);
  Expect.equals(9, res);

  res = l.firstWhere((element) => element > 1);
  Expect.equals(2, res);
}
