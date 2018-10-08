/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E first
 * Returns the first element.
 * @description Checks that [first] can be set.
 * @author msyabro
 * @author sgrekhov@unipro.ru
 * @issue dart-lang/co19#130
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

void check(List<Float32x4> array) {
  dynamic l = new Float32x4List.fromList(array);
  l.first = pack(3.14);
  Expect.isTrue(equal(pack(3.14), l.first));
}
void checkClear(int length) {
  dynamic l = new Float32x4List(length);
  l.first = pack(3.14);
  Expect.isTrue(equal(pack(3.14), l.first));
}

main() {
  check([pack(1.0)]);
  check([pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0)]);
  check([
    pack(1.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0)
  ]);

  checkClear(1);
  checkClear(100);
}
