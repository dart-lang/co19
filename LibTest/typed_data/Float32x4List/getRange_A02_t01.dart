/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> getRange(int start, int end)
 * Returns an [Iterable] that iterates over the elements in the range [start]
 * inclusive to [end] exclusive.
 * @description Checks that the result of [getRange] is backed by [this].
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
  var l = new Float32x4List.fromList(
      [pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0)]);
  var res = l.getRange(0, 5);
  Expect.isTrue(equal(pack(0.0), res.elementAt(0)));
  l[0] = pack(1.0);
  Expect.isTrue(equal(pack(1.0), res.elementAt(0)));
}
