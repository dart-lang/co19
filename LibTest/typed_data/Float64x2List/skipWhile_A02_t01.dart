/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * ...
 * The filtering happens lazily.
 * @description Checks that the filtering happens lazily.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  Float64x2List l = new Float64x2List(10);
  var count = 0;
  test(e) {
    count++;
    return false;
  }

  var res = l.skipWhile(test);
  Expect.equals(0, count);
  res.elementAt(0);
  Expect.equals(1, count);
  res.elementAt(3);
  Expect.equals(2, count);
  res.elementAt(1);
  Expect.equals(3, count);
}
