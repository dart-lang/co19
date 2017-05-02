/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E current
 * Gets the current element in the iteration.
 * @description Checks that the current element in the iteration is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}


void checkNext(List<Float32x4> list) {
  var l = new Float32x4List.fromList(list);
  var it = l.iterator;
  var i = 0;
  while (it.moveNext()) {
    Expect.isTrue(equal(l[i++], it.current));
  }
}

main() {
  checkNext([pack(1.0)]);
  checkNext([pack(1.0), pack(2.0), pack(3.0)]);

  var a = new List<Float32x4>(255);
  for (var i=0; i < a.length; i++) {
    a[i] = pack((a.length - i) * 1.0);
  }
  checkNext(a);
}
