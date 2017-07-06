/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> toSet()
 * Creates a [Set] containing the elements of this [Iterable].
 * The set may contain fewer elements than the iterable, if the iterable
 * contains an element more than once, or it contains one or more elements
 * that are equal. The order of the elements in the set is not guaranteed to
 * be the same as for the iterable.
 * @description Checks that the returned [Set] contains all elements of [this].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<double> list, int uniqueNum) {
  var l = new Float32List.fromList(list);
  var res = l.toSet();

  Expect.equals(uniqueNum, res.length);
  for (int i = 0; i < l.length; ++i) {
    Expect.isTrue(res.contains(l[i]));
  }
}

main() {
  check([], 0);
  check([0.0], 1);
  check([0.0, 0.0, 0.0, 0.0, 0.0], 1);
  check([
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0,
    1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0,
    2.0, 2.0, 3.0, 3.0, 3.0, 3.0, 3.0, 3.0, 3.0, 3.0, 3.0, 3.0, 4.0, 4.0,
    4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 5.0, 5.0, 5.0, 5.0, 5.0, 5.0,
    5.0, 5.0, 5.0, 5.0, 6.0, 6.0, 6.0, 6.0, 6.0, 6.0, 6.0, 6.0, 6.0, 6.0,
    7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 8.0, 8.0, 8.0, 8.0, 8.0,
    8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 9.0, 9.0, 9.0, 9.0, 9.0, 9.0, 9.0, 9.0,
    9.0, 9.0
  ], 10);
}
