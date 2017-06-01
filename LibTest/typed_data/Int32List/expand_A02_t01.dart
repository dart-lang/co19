/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> expand<T>(Iterable<T> f(E element))
 * ...
 * The returned Iterable is lazy, and calls f for each element of this every
 * time it's iterated.
 * @description Checks that the returned Iterable is lazy, and calls f for each
 * element of this every time it's iterated.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Int32List.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  var counter = 0;
  var res = l.expand((element) {counter++; return [element * 2];});
  Expect.equals(0, counter);

  var n = 0;
  for (int i = 0; i < l.length; ++i) {
    Expect.equals(l[i] * 2, res.elementAt(i));
    n += i + 1;
    Expect.equals(n, counter);
  }

  var it = res.iterator;
  counter = 0;
  n = 0;
  while (it.moveNext()) {
    Expect.equals(l[n++] * 2, it.current);
    Expect.equals(n, counter);
  }
}
