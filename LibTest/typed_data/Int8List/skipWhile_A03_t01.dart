/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E element))
 * ...
 * Every new [Iterator] of the returned [Iterable] iterates over all elements
 * of [this].
 * @description Checks that every new [Iterator] of the returned [Iterable]
 * iterates over all elements of [this].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var count = 0;
  bool test(int e) {
    ++count;
    return e < 3;
  }

  var list = new Int8List.fromList([1, 2, 3, 4, 5]);
  var res = list.skipWhile(test);
  Expect.equals(0, count);
  res.elementAt(0);
  Expect.equals(3, count);   //three elements will be tested.

  res.elementAt(0);
  Expect.equals(6, count);

  var it = res.iterator;
  it.moveNext();
  Expect.equals(9, count);

  it.moveNext();
  Expect.equals(9, count);
}
