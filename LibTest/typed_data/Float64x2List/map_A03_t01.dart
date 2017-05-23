/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> map<T>(T f(E e))
 * ...
 * The transformed elements will not be cached. Iterating multiple times over
 * the returned Iterable will invoke the supplied function f multiple times on
 * the same element.
 * @description Checks that iterating multiple times over the returned Iterable
 * will invoke the supplied function f multiple times on the same element.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2(v, v+1);

main() {
  var count = 0;
  f(e) {
    count++;
    return e;
  }
  var l = new Float64x2List.fromList(
      [f64x2(5.0), f64x2(7.0), f64x2(9.0), f64x2(11.0)]
  );
  var res = l.map(f);

  Expect.equals(0, count);
  res.elementAt(0);
  Expect.equals(1, count);
  res.elementAt(0);
  Expect.equals(2, count);
  res.elementAt(1);
  Expect.equals(3, count);
}
