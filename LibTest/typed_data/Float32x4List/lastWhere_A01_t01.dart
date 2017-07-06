/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E lastWhere(bool test(E element), {E orElse()})
 * Returns the last element that satisfies the given predicate [test].
 * @description Checks that the last element that satisfies the given predicate
 * is returned.
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
    pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0), pack(9.0)
  ]);
  var res = l.lastWhere(
    (element) => element.x == 1.0
  );
  Expect.isTrue(equal(pack(1.0), res));

  res = l.lastWhere(
    (element) => element.y > 6.0
  );
  Expect.isTrue(equal(pack(9.0), res));

  res = l.lastWhere(
    (element) => element.w > 1.0
  );
  Expect.isTrue(equal(pack(9.0), res));
}
