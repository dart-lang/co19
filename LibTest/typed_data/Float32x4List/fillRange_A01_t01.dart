/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void fillRange(int start, int end, [E fillValue])
 * Sets the objects in the range [start] inclusive to [end] exclusive to the
 * given fillValue.
 * @description Checks that the given range is filled with [fillValue].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

main() {
  var l = new Float32x4List(1000);
  l.fillRange(0, 10, pack(1.0));
  for (int i = 0; i < 10; ++i) {
    Expect.isTrue(equal(pack(1.0), l[i]));
  }
  Expect.isTrue(equal(pack(.0), l[10]), "[end] should be exclusive");

  l.fillRange(100, 200, pack(55.0));
  for (int i = 100; i < 200; ++i) {
    Expect.isTrue(equal(pack(55.0), l[i]));
  }
  Expect.isTrue(equal(pack(.0), l[200]), "[end] should be exclusive");

  l.fillRange(0, 1000, pack(1.0));
  for (int i = 0; i < 1000; ++i) {
    Expect.isTrue(equal(pack(1.0), l[i]));
  }

  l.fillRange(0, 0, pack(2.0));
  for (int i = 0; i < 1000; ++i) {
    Expect.isTrue(equal(pack(1.0), l[i]));
  }
}
