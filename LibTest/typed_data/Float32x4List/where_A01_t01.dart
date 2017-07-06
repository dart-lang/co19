/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool test(E element))
 * Returns a new lazy [Iterable] with all elements that satisfy the predicate
 * [test].
 * The matching elements have the same order in the returned iterable as they
 * have in iterator.
 * This method returns a view of the mapped elements.
 * @description Checks that the returned [Iterable] contains all elements from
 * [this] that satisfy [test], and all other elements are skipped.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

void check(List<Float32x4> list, bool test (Float32x4 element)) {
  var l = new Float32x4List.fromList(list);
  var res = l.where(test);

  var count = 0;

  for (int i = 0 ; i < list.length; ++i) {
    if (test(l[i])) {
      Expect.isTrue(equal(l[i], res.elementAt(count)));
      ++count;
    }
  }
  Expect.equals(count, res.length);
}

main() {
  check([], (e) => true);
  check([pack(1.0)], (e) => false);
  check([pack(1.0), pack(1.0), pack(1.0), pack(2.0), pack(1.0), pack(1.0)],
      (e) => e.x == 1.0 );
  check([pack(0.0), pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0)],
      (e) => e.x < 5.0 );
  check([pack(0.0), pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0)],
      (e) => e.x > 0.0 );
  check([pack(0.0), pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0)],
      (e) => e.x != 2.0 );
}
