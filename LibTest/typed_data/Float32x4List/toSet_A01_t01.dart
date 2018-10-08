/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> toSet()
 * Creates a [Set] containing the elements of this iterable.
 * @description Checks that the returned [Set] contains all elements from
 * [this].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

void check(List<Float32x4> list) {
  var l = new Float32x4List.fromList(list);
  var res = l.toSet();

  Expect.equals(list.length, res.length);
  for (int i = 0; i < l.length; ++i) {
    Expect.isTrue(res.any((x) => equal(l[i], x)));
  }
}

main() {
  check([]);
  check([pack(0.0)]);
  check([pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0)]);
  check([
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(1.0), pack(1.0),
    pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0),
    pack(1.0), pack(1.0), pack(2.0), pack(2.0), pack(2.0), pack(2.0),
    pack(2.0), pack(2.0), pack(2.0), pack(2.0), pack(2.0), pack(2.0),
    pack(3.0), pack(3.0), pack(3.0), pack(3.0), pack(3.0), pack(3.0),
    pack(3.0), pack(3.0), pack(3.0), pack(3.0), pack(4.0), pack(4.0),
    pack(4.0), pack(4.0), pack(4.0), pack(4.0), pack(4.0), pack(4.0),
    pack(4.0), pack(4.0), pack(5.0), pack(5.0), pack(5.0), pack(5.0),
    pack(5.0), pack(5.0), pack(5.0), pack(5.0), pack(5.0), pack(5.0),
    pack(6.0), pack(6.0), pack(6.0), pack(6.0), pack(6.0), pack(6.0),
    pack(6.0), pack(6.0), pack(6.0), pack(6.0), pack(7.0), pack(7.0),
    pack(7.0), pack(7.0), pack(7.0), pack(7.0), pack(7.0), pack(7.0),
    pack(7.0), pack(7.0), pack(8.0), pack(8.0), pack(8.0), pack(8.0),
    pack(8.0), pack(8.0), pack(8.0), pack(8.0), pack(8.0), pack(8.0),
    pack(9.0), pack(9.0), pack(9.0), pack(9.0), pack(9.0), pack(9.0),
    pack(9.0), pack(9.0), pack(9.0), pack(9.0)
  ]);
}
