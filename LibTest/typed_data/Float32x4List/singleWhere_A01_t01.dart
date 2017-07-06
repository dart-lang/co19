/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E singleWhere(bool test(E element))
 * Returns the single element that satisfies [test].
 * Checks all elements to see if test(element) returns true. If exactly one
 * element satisfies test, that element is returned.
 * @description Checks that the single element satisfying [test] is returned.
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
  var l = new Float32x4List.fromList([
    pack(.0), pack(.0), pack(.0), pack(.0), pack(.0), pack(5.0), pack(.0),
    pack(.0), pack(-10.0), pack(.0)
  ]);

  var res = l.singleWhere((e) => e.x > 0 );
  Expect.isTrue(equal(pack(5.0), res));

  res = l.singleWhere((e) => e.x < 0 );
  Expect.isTrue(equal(pack(-10.0), res));
}
