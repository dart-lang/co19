/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterator<E> iterator
 * ...
 * Modifying the collection may cause new iterators to produce different
 * elements, and may change the order of existing elements. A List specifies its
 * iteration order precisely, so modifying the list changes the iteration
 * order predictably.
 * @description Checks that the iterators of the same iterable can return the
 * different values for the same element if the underlying collection is
 * changed.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4p(n) => new Int32x4(n, n + 1, n + 2, n + 3);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

main() {
  var l = new Int32x4List.fromList(
      [i32x4p(1), i32x4p(5), i32x4p(9), i32x4p(13)]);
  var it1 = l.iterator;
  var it2 = l.iterator;
  var it3 = l.iterator;
  it1.moveNext();
  Expect.isTrue(equal(i32x4p(1), it1.current));

  l[0] = i32x4p(11);
  it2.moveNext();
  l[0] = i32x4p(21);
  Expect.isTrue(equal(i32x4p(11), it2.current));
  Expect.isTrue(equal(i32x4p(1), it1.current));

  it3.moveNext();
  Expect.isTrue(equal(i32x4p(21), it3.current));
  Expect.isTrue(equal(i32x4p(11), it2.current));
  Expect.isTrue(equal(i32x4p(1), it1.current));

  it1.moveNext();
  it2.moveNext();
  it3.moveNext();
  Expect.isTrue(equal(it1.current, it2.current));
  Expect.isTrue(equal(it1.current, it3.current));
}
