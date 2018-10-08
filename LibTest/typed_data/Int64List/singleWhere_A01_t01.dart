/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E singleWhere(bool test(E element))
 * Returns the single element that satisfies [test].
 * Checks all elements to see if test(element) returns true. If exactly one
 * element satisfies test, that element is returned.
 * @description Checks that the single element satisfying [test] is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Int64List.fromList([0, 0, 0, 0, 0, 5, 0, 0, -10, 0]);

  var res = l.singleWhere((e) => e > 0 );
  Expect.equals(5, res);

  res = l.singleWhere((e) => e < 0 );
  Expect.equals(-10, res);
}
