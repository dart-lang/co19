/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * ...
 * Every new Iterator of the returned iterable iterates over all elements of
 * this.
 * @description Checks that every new Iterator of the returned iterable iterates
 * over all elements of this.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var counter = 0;
  bool test(e) {
    counter++;
    return e.x < 5;
  }
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(6), i32x4(4), i32x4(5)];
  var l = new Int32x4List.fromList(list);

  var res = l.skipWhile(test);
  Expect.equals(0, counter);
  res.elementAt(0);
  Expect.equals(4, counter);  // four elements were tested
  res.elementAt(1);
  Expect.equals(8, counter);  // four elements were tested
  res.elementAt(0);
  Expect.equals(12, counter);  // four elements were tested

  var it1 = res.iterator;
  var it2 = res.iterator;
  counter = 0;

  it1.moveNext();
  Expect.equals(4, counter);  // four elements were tested
  it1.moveNext();
  Expect.equals(4, counter);  // no tested elements
  it2.moveNext();
  Expect.equals(8, counter);  // four elements were tested
}
