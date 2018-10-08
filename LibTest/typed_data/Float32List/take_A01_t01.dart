/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * Returns a lazy [Iterable] of the [count] first elements of this iterable.
 * @description Checks that the returned [Iterable] has the length [count] and
 * contains first [count] elements from [this].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<double> list, int n) {
  var l = new Float32List.fromList(list);
  var res = l.take(n);
  Expect.equals(n, res.length);

  for (int i = 0; i < n; ++i) {
    Expect.equals(l[i], res.elementAt(i));
  }
}

main() {
  check([], 0);
  check([1.0], 0);
  check([1.0], 1);

  check([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0], 0);
  check([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0], 1);
  check([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0], 5);
  check([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0], 10);

}
