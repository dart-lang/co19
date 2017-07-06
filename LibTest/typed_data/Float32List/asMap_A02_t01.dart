/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<int, E> asMap()
 * ...
 * The Map.keys Iterable iterates the indices of this list in numerical order.
 * @description Checks that the [Maps.keys] iterates the indices in numerical
 * order.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<double> list) {
  var l = new Float32List.fromList(list);
  var iterable = l.asMap().keys;
  var it = iterable.iterator;
  var i = 0;
  while (it.moveNext()) {
    Expect.equals(i++, it.current);
  }
}

main() {
  check([]);
  check([1.0]);
  check([
    1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0,
    14.0, 15.0
  ]);
}
