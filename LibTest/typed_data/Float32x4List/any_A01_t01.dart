/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool any(bool f(E element))
 * Checks whether any element of this iterable satisfies test.
 * Checks every element in iteration order, and returns true if any of them make
 * [test] return true, otherwise returns false.
 * @description Checks that true is returned if one or more elements satisfies
 * the predicate f, false otherwise.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

bool pred(Float32x4 element) => element.greaterThan(pack(.0, .0, 5.0, .0)).flagZ;

Float32x4 pack(x, y, z, w) => new Float32x4(x, y, z, w);

main() {
  var l;
  l = new Float32x4List.fromList([]);
  Expect.isFalse(l.any(pred));

  l = new Float32x4List.fromList([pack(1.0, 1.0, 1.0, 1.0)]);
  Expect.isFalse(l.any(pred));

  l = new Float32x4List.fromList([
    pack(.0, .0, 1.0, .0), pack(.0, .0, 2.0, .0), pack(.0, .0, 3.0, .0),
    pack(.0, .0, 4.0, .0), pack(.0, .0, 5.0, .0), pack(.0, .0, 1.0, .0),
    pack(.0, .0, 2.0, .0), pack(.0, .0, 3.0, .0), pack(.0, .0, 4.0, .0),
    pack(.0, .0, 5.0, .0)
  ]);
  Expect.isFalse(l.any(pred));

  l = new Float32x4List.fromList([pack(.0, .0, 100.0, .0)]);
  Expect.isTrue(l.any(pred));

  l = new Float32x4List.fromList([
    pack(.0, .0, 6.0, .0), pack(.0, .0, 7.0, .0), pack(.0, .0, 8.0, .0),
    pack(.0, .0, 9.0, .0), pack(.0, .0, 10.0, .0)
  ]);
  Expect.isTrue(l.any(pred));

  l = new Float32x4List.fromList([
    pack(.0, .0, 1.0, .0), pack(.0, .0, 2.0, .0), pack(.0, .0, 3.0, .0),
    pack(.0, .0, 6.0, .0), pack(.0, .0, 4.0, .0), pack(.0, .0, 5.0, .0)
  ]);
  Expect.isTrue(l.any(pred));
}
