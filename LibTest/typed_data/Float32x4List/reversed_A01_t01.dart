/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> reversed
 * Returns an [Iterable] of the objects in [this] list in reverse order.
 * @description Checks that the elements of [reversed] are the elements
 * of [this] in reverse order.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

check(List<Float32x4> list) {
  var l = new Float32x4List.fromList(list);
  var rev = l.reversed;
  for (int i = 0; i < list.length; ++i) {
    Expect.isTrue(equal(l.elementAt(list.length - 1 - i), rev.elementAt(i)));
  }
}

main() {
  check([]);
  check([pack(1.0)]);
  check([pack(1.0), pack(2.0)]);
  check([pack(1.0), pack(2.0), pack(3.0)]);
  var list = new List<Float32x4>(1000);
  for (int i = 0; i < 1000; ++i) {
    list[i] = pack(i * 1.0);
  }
  check(list);
}
