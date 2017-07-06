/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(E element))
 * Applies the function [f] to each element of this collection in iteration
 * order.
 * @description Checks that the function [f] is called for each element of the
 * list.
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
  var l = new Float32x4List(0);
  var res = pack(.0);
  l.forEach((e) {
    res += e;
  });
  Expect.isTrue(equal(pack(.0), res));

  l = new Float32x4List.fromList([
    pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0),
    pack(1.0), pack(1.0), pack(1.0), pack(1.0)
  ]);
  l.forEach((e) {
    res += e;
  });
  Expect.isTrue(equal(pack(10.0), res));
}
