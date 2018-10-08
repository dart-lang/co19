/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic lastWhere(bool test(E element), {Object orElse()})
 * If no element satisfies [test], the result of invoking the [orElse] function
 * is returned.
 * @description Checks that the [orElse] function is invoked and its result is
 * returned if no element satisfies [test].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var count = 0;
  f() {
    count++;
    return 1.0;
  }
  var l = new Float32List.fromList([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 9.0]);
  var res = l.lastWhere((element) => false, orElse: f);
  Expect.equals(1, count);
  Expect.equals(1.0, res);

  res = l.lastWhere((element) => element > 100.0, orElse: f);
  Expect.equals(2, count);
  Expect.equals(1.0, res);

  l = new Float32List.fromList([]);
  res = l.lastWhere((element) => true, orElse: f);
  Expect.equals(3, count);
  Expect.equals(1.0, res);
}
