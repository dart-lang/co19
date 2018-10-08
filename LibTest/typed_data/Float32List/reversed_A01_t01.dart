/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> reversed
 * Returns an [Iterable] of the objects of this [List] in reverse order.
 * @description Checks that the elements of [reversed] are the elements
 * of [this] in reverse order.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<double> list) {
  var l = new Float32List.fromList(list);
  var rev = l.reversed;
  for (int i = 0; i < list.length; ++i) {
    Expect.equals(l.elementAt(list.length - 1 - i), rev.elementAt(i));
  }
}

main() {
  check([]);
  check([1.0]);
  check([1.0, 2.0]);
  check([1.0, 2.0, 3.0]);
  var list = new List<double>(255);
  for (int i = 0; i < 255; ++i) {
    list[i] = i * 1.0;
  }
  check(list);
}
