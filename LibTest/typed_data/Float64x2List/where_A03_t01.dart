/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool test(E element))
 * ...
 * Iterating will not cache results, and thus iterating multiple times over the
 * returned Iterable may invoke the supplied function test multiple times on the
 * same element.
 * @description Checks that the iterating multiple times over the returned
 * Iterable may invoke the supplied function test multiple times on the same
 * element.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  var l = new Float64x2List.fromList([f64x2(6.0), f64x2(1.0), f64x2(4.0)]);
  var counter = 0;
  test(e) {
    counter++;
    return true;
  }
  var res = l.where(test);
  Expect.equals(0, counter);

  res.elementAt(0);
  Expect.equals(1, counter);

  res.elementAt(0);
  Expect.equals(2, counter);

  res.elementAt(1);
  Expect.equals(4, counter);

  res.elementAt(2);
  Expect.equals(7, counter);
}
