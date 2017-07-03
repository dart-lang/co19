/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool test(E element))
 * Returns a new lazy [Iterable] with all elements that satisfy the predicate
 * [test].
 * @description Checks that the returned [Iterable] contains all elements from
 * [this] that satisfy [test], and all other elements are skipped.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> list, bool test (int element)) {
  var l = new Uint64List.fromList(list);
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
  check([1], (e) => false);
  check([1, 1, 1, 2, 1, 1], (e) => e == 1 );
  check([0, 1, 2, 3, 4, 5], (e) => e < 5 );
  check([0, 1, 2, 3, 4, 5], (e) => e > 0 );
  check([0, 1, 2, 3, 4, 5], (e) => e != 2 );
}
