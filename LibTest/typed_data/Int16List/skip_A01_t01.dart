/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skip(int count)
 * Returns an Iterable that provides all but the first count elements.
 * @description Checks that the correct [Iterable] is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list, int n) {
  var l = new Int16List.fromList(list);
  var res = l.skip(n);
  Expect.equals(l.length - n, res.length);

  for (int i = 0; i < res.length; ++i) {
    Expect.equals(l.elementAt(i + n), res.elementAt(i));
  }
}

main() {
  check([], 0);

  for (int i = 0; i <= 10 ; ++i) {
    check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], i);
  }
}
