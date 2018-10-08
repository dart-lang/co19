/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skip(int count)
 * ...
 * When the returned iterable is iterated, it starts iterating over this, first
 * skipping past the initial count elements. If this has fewer than count
 * elements, then the resulting Iterable is empty. After that, the remaining
 * elements are iterated in the same order as in this iterable.
 * @description Checks that the returned [Iterable] is empty if [this] has
 * fewer than [count] elements.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<double> list, int n) {
  var l = new Float32List.fromList(list);
  var res = l.skip(n);
  Expect.isTrue(res.isEmpty);
}

main() {
  check([], 1);
  check([1.0, 2.0], 3);
  check([
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0
  ], 100);
}

