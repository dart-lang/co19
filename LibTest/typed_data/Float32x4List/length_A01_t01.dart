/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int length
 * Returns the number of elements in the list.
 * @description Checks that the number of elements is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);
Float32x4 O() => new Float32x4.zero();

void check(List<Float32x4> array, int length) {
  var l = new Float32x4List.fromList(array);
  Expect.equals(length, l.length);
}

main() {
  check([], 0);
  check([pack(1.0)], 1);
  check([pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0)], 5);
  check([
    O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(),
    O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(),
    O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(),
    O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(),
    O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(),
    O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(),
    O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(),
    O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(),
    O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(),
    O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(),
    O(), O(), O(), O(), O(), O(), O(), O(), O(), O()
  ], 150);
}
