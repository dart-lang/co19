/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * Returns a lazy iterable of the [count] first elements of this iterable.
 * @description Checks that the returned [Iterable] has the length [count] and
 * contains first [count] elements from [this].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

void check(List<Float32x4> list, int n) {
  var l = new Float32x4List.fromList(list);
  var res = l.take(n);
  Expect.equals(n, res.length);

  for (int i = 0; i < n; ++i) {
    Expect.isTrue(equal(l[i], res.elementAt(i)));
  }
}

main() {
  check([], 0);
  check([pack(1.0)], 0);
  check([pack(1.0)], 1);

  check([
    pack(0.0), pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0),
    pack(6.0), pack(7.0), pack(8.0), pack(9.0)
  ], 0);
  check([
    pack(0.0), pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0),
    pack(6.0), pack(7.0), pack(8.0), pack(9.0)
  ], 1);
  check([
    pack(0.0), pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0),
    pack(6.0), pack(7.0), pack(8.0), pack(9.0)
  ], 5);
  check([
    pack(0.0), pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0),
    pack(6.0), pack(7.0), pack(8.0), pack(9.0)
  ], 10);
}
