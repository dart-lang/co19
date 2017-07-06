/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E last
 * Returns the last element.
 * @description Checks that the last element of a list is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

void check(List<Float32x4> array) {
  var l = new Float32x4List.fromList(array);
  Expect.isTrue(equal(array[l.length - 1], l.last));
}
void checkClear(int length) {
  var l = new Float32x4List(length);
  Expect.isTrue(equal(pack(0.0), l.last));
}

main() {
  check([pack(1.0)]);
  check([pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0)]);
  check([
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(1.0)
  ]);

  checkClear(1);
  checkClear(100);
}
