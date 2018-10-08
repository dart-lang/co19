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
 * @description Checks that iterating multiple times over the returned Iterable
 * may invoke the supplied function test multiple times on the same element.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

main() {
  var counter = 0;
  bool test(e) {
    counter++;
    return e.x < 5;
  }
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(6), i32x4(4), i32x4(5)];
  var l = new Int32x4List.fromList(list);

  var res = l.where(test);
  Expect.equals(0, counter);
  res.elementAt(0);
  Expect.equals(1, counter);
  res.elementAt(1);
  Expect.equals(3, counter);
  res.elementAt(0);
  Expect.equals(4, counter);
  res.elementAt(3);
  Expect.equals(9, counter);

  var it1 = res.iterator;
  var it2 = res.iterator;
  counter = 0;

  it1.moveNext();
  Expect.equals(1, counter);
  it1.moveNext();
  Expect.equals(2, counter);
  it2.moveNext();
  Expect.equals(3, counter);
}
