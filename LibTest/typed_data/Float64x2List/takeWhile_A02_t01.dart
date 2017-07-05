/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E value))
 * ...
 * The filtering happens lazily.
 * @description Checks that the filtering happens lazily. Function test is
 * called when elements are iterated.
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
    return true;
  }
  var res = l.takeWhile(test);
  Expect.equals(0, counter);
  res.elementAt(0);
  Expect.equals(1, counter);
}
