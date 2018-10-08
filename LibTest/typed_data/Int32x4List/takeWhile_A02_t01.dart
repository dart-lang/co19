/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E value))
 * ...
 * The filtering happens lazily.
 * @description Checks that the filtering happens lazily and function test is
 * invoked when iterable is iterated.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var counter = 0;
  bool test(e) {
    counter++;
    return e.x == 0;
  }
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(6), i32x4(4), i32x4(5)];
  var l = new Int32x4List.fromList(list);

  var res = l.takeWhile(test);
  Expect.equals(0, counter);
  res.elementAt(0);
  Expect.equals(1, counter);
}
