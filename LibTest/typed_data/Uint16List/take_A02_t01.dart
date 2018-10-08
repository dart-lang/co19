/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * ...
 * The returned [Iterable] may contain fewer than [n] elements, if [this]
 * contains fewer than [count] elements, if this contains fewer than  [count]
 * elements.
 * @description Checks that the returned [Iterable] contains fewer then [count]
 * elements, if [this] contains fewer then [count] elements.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> list, int n) {
  var l = new Uint16List.fromList(list);
  var res = l.take(n);
  Expect.equals(l.length, res.length);

  for (int i = 0; i < l.length; ++i) {
    Expect.equals(l[i], res.elementAt(i));
  }
}

main() {
  check([], 100);
  check([1], 5);

  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 11);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 1000000);
}
