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
 * @description Checks that the returned [Iterable] contains all elements
 * from [this] that satisfy [test] in the same order as the matched element in
 * this, and all other elements are skipped.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<double> list, bool test (double element)) {
  var l = new Float32List.fromList(list);
  var res = l.where(test);

  var count = 0;

  for (int i = 0 ; i < list.length; ++i) {
    if (test(l[i])) {
      Expect.equals(l[i], res.elementAt(count));
      ++count;
    }
  }
  Expect.equals(count, res.length);
}

main() {
  check([], (e) => true);
  check([1.0], (e) => false);
  check([1.0, 1.0, 1.0, 2.0, 1.0, 1.0], (e) => e == 1.0);
  check([0.0, 1.0, 2.0, 3.0, 4.0, 5.0], (e) => e < 5.0);
  check([0.0, 1.0, 2.0, 3.0, 4.0, 5.0], (e) => e > 0.0);
  check([0.0, 1.0, 2.0, 3.0, 4.0, 5.0], (e) => e != 2.0);
}
