/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skip(int count)
 * Returns an [Iterable] that provides all but the first count elements.
 * @description Checks that the correct [Iterable] is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

check(List<Float32x4> list, int n) {
  var l = new Float32x4List.fromList(list);
  var res = l.skip(n);
  Expect.equals(l.length - n, res.length);

  for (int i = 0; i < res.length; ++i) {
    Expect.isTrue(equal(l.elementAt(i+n), res.elementAt(i)));
  }
}

main() {
  check([], 0);

  for (int i = 0; i <= 10 ; ++i) {
    check([
      pack(0.0), pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0),
      pack(6.0), pack(7.0), pack(8.0), pack(9.0)
    ], i);
  }
}
