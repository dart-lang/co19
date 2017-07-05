/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E value))
 * ...
 * The elements can be computed by stepping through iterator until an element
 * is found where test(element) is false. At that point, the returned iterable
 * stops (its moveNext() returns false).
 * @description Checks that the elements can be computed by stepping through
 * iterator until an element is found where test(element) is false.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  List<Float64x2> list = [
    f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0), f64x2(6.0)
  ];
  var l = new Float64x2List.fromList(list);
  var counter = 0;
  bool test(e) {
    counter++;
    return e.x < 3.0;
  }
  var res = l.takeWhile(test);

  var it = res.iterator;
  while (it.moveNext()) {
  }
  Expect.equals(3, counter);
}
