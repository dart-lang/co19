/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> reversed
 * Returns an [Iterable] of the elements of this [List] in reverse order.
 * @description Checks that the elements of [reversed] are the elements
 * of [this] in reverse order.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  var l = new Int32List.fromList(list);
  var rev = l.reversed;
  for (int i = 0; i < list.length; ++i) {
    Expect.equals(l.elementAt(list.length - 1 - i), rev.elementAt(i));
  }
}

main() {
  check([]);
  check([1]);
  check([1, 2]);
  check([1, 2, 3]);
  var list = new List<int>(255);
  for (int i = 0; i < 255; ++i) {
    list[i] = i;
  }
  check(list);
}
