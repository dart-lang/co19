/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * Every new [Iterator] of the returned [Iterable] iterates over all elements
 * of [this].
 * @description Checks that every new [Iterator] of the returned [Iterable]
 * iterates over all elements of [this].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

main() {
  var count = 0;

  bool test(Float32x4 e) {
    ++count;
    return e.x < 3.0;
  }

  var list = new Float32x4List.fromList(
      [pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0)]);
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
