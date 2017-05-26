/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * Returns a lazy iterable of the count first elements of this iterable.
 * @description Checks that the returned [Iterable] has the length [count] and
 * contains first [count] elements from [this].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> list, int n) {
  var l = new Int8List.fromList(list);
  var res = l.take(n);
  Expect.equals(n, res.length);

  for (int i = 0; i < n; ++i) {
    Expect.equals(l[i], res.elementAt(i));
  }
}

main() {
  check([], 0);
  check([1], 0);
  check([1], 1);

  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 0);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 1);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 5);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 10);
}
