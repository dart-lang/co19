/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> expand<T>(Iterable<T> f(E element))
 * Expands each element of this Iterable into zero or more elements.
 * The resulting Iterable runs through the elements returned by f for each
 * element of this, in iteration order.
 * @description Checks that the returned iterable is correct.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4p(n) => new Int32x4(n, n + 1, n + 2, n + 3);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

void check(list) {
  var l = new Int32x4List.fromList(list);

  var res = l.expand((e) => [e + i32x4p(2)]);
  Expect.equals(l.length, res.length);
  for (int i = 0; i < l.length; ++i) {
    Expect.isTrue(equal(l[i] + i32x4p(2), res.elementAt(i)));
  }

  res = l.expand((e) => [e, e + i32x4p(2)]);
  Expect.equals(l.length * 2, res.length);
  for (int i = 0; i < l.length; ++i) {
    Expect.isTrue(equal(l[i], res.elementAt(i * 2)));
    Expect.isTrue(equal(l[i] + i32x4p(2), res.elementAt(i * 2 + 1)));
  }

  res = l.expand((e) => []);
  Expect.equals(0, res.length);
}

main() {
  check([i32x4p(1)]);
  check([i32x4p(1), i32x4p(5), i32x4p(9), i32x4p(13)]);
  check([
    i32x4p(0), i32x4p(1), i32x4p(2), i32x4p(3), i32x4p(4), i32x4p(5), i32x4p(6),
    i32x4p(7),i32x4p(8), i32x4p(9)
  ]);
}
