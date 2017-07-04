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
 * @description Checks that the returned [Iterable] is lazy, and calls f for
 * each element of this every time it's iterated.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  var l = new Uint64List.fromList(list);
  var counter = 0;
  var count = 0;
  var res = l.expand((element) {counter++; return [element * 2];});
  Expect.equals(0, counter);

  for (int i = 0; i < list.length; ++i) {
    Expect.equals(list[i] * 2, res.elementAt(i));
    count += i + 1;
    Expect.equals(count, counter);
  }
}

main() {
  check([]);
  check([1]);
  check([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
}
