/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E single
 * Checks that this iterable has only one element, and returns that element.
 * @description Checks that the single element of a list is returned.
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
  var l;

  l = new Float32x4List.fromList([pack(0.0)]);
  Expect.isTrue(equal(pack(0.0), l.single));
  l = new Float32x4List.fromList([pack(127.0)]);
  Expect.isTrue(equal(pack(127.0), l.single));
  l = new Float32x4List.fromList([pack(-1.0)]);
  Expect.isTrue(equal(pack(-1.0), l.single));
}
