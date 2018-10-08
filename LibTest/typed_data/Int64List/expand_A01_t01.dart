/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> expand<T>(Iterable f(E element))
 * Expands each element of this Iterable into zero or more elements.
 * The resulting Iterable runs through the elements returned by f for each
 * element of this, in iteration order.
 * @description Checks that the returned [Iterable] contains correct elements
 * and has the correct length.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  var l = new Int64List.fromList(list);

  var res = l.expand((element) => [element * 2]);
  Expect.equals(list.length, res.length);
  for (int i = 0; i < list.length; ++i) {
    Expect.equals(list[i] * 2, res.elementAt(i));
  }

  res = l.expand((element) => [element, element + 1]);
  Expect.equals(list.length * 2, res.length);
  for (int i = 0; i < list.length; ++i) {
    Expect.equals(list[i], res.elementAt(2 * i));
    Expect.equals(list[i] + 1, res.elementAt(2 * i + 1));
  }

  res = l.expand((element) => [] );
  Expect.equals(0, res.length);
}

main() {
  check([]);
  check([1]);
  check([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
}
