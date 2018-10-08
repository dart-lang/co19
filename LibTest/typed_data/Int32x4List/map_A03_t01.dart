/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> map<T>(T f(E e))
 * ...
 * The transformed elements will not be cached. Iterating multiple times over
 * the returned Iterable will invoke the supplied function f multiple times on
 * the same element.
 * @description Checks that iterating multiple times over the returned Iterable
 * will invoke the supplied function f multiple times on the same element.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var counter = 0;
  f(e) {
    counter++;
    return e.z;
  }
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(1), i32x4(3), i32x4(4)];
  var l = new Int32x4List.fromList(list);
  var res = l.map(f);
  var it1 = res.iterator;
  var it2 = res.iterator;
  var i = 0;

  Expect.equals(0, counter);
  while (it1.moveNext()) {
    Expect.equals(++i, counter);
    it2.moveNext();
    Expect.equals(++i, counter);
    Expect.equals(it1.current, it2.current);
  }
  Expect.equals(res.length * 2, counter);
}
