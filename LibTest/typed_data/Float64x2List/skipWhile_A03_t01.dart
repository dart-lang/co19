/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * ...
 * Every new Iterator of the returned iterable iterates over all elements of
 * this.
 * @description Checks that every new Iterator of the returned iterable iterates
 * over all elements of this.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  Float64x2List l = new Float64x2List.fromList(
      [f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(1.0), f64x2(2.0)]);
  var count = 0;
  bool test(Float64x2 e) {
    count++;
    return e.x < 3.0;
  }

  var res = l.skipWhile(test);
  Expect.equals(0, count);
  res.elementAt(0);
  Expect.equals(3, count);
  res.elementAt(1);
  Expect.equals(6, count);
  res.elementAt(2);
  Expect.equals(9, count);
}
