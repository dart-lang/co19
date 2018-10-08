/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * ...
 * The returned iterable provides elements by iterating this iterable, but
 * skipping over all initial elements where test(element) returns true. If all
 * elements satisfy test the resulting iterable is empty, otherwise it iterates
 * the remaining elements in their original order, starting with the first
 * element for which test(element) returns false.
 * @description Checks that Iterable iterates the remaining elements in their
 * original order, starting with the first element for which test(element)
 * returns false. If all elements satisfy test the resulting Iterable is empty.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

main() {
  var list = new Float32x4List.fromList(
      [pack(1.0), pack(1.0), pack(2.0), pack(1.0), pack(1.0), pack(1.0)]);
  var res = list.skipWhile((e) => e.x == 1.0);
  Expect.equals(4, res.length);
  for (int i = 0; i < 4; ++i) {
    Expect.isTrue(equal(list.elementAt(i+2), res.elementAt(i)));
  }

  res = list.skipWhile((e) => e.x < 3.0);
  Expect.equals(0, res.length);
  Expect.isTrue(res.isEmpty);
}
