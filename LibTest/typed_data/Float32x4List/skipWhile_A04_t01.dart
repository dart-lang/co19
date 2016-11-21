/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E element))
 * Once an element does not satisfy the [test] the iterator
 * stops testing and uses every later element unconditionally.
 * @description Checks that once an element does not satisfy
 * the [test] every later element is used unconditionally.
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
  var list = new Float32x4List.fromList([pack(1.0), pack(1.0), pack(2.0), pack(1.0), pack(1.0), pack(1.0)]);
  var res = list.skipWhile((e) => e.x == 1.0);
  Expect.equals(4, res.length);
  for(int i = 1; i < 4; ++i) {
    Expect.isTrue(equal(pack(1.0), res.elementAt(i)));
  }
}
