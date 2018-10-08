/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * ...
 * The [count] must not be negative.
 * @description Checks that it is an error if [count] is negative.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

void check(List<Float32x4> list, int n) {
  var l = new Float32x4List.fromList(list);

  Expect.throws(() {
    l.take(n);
  });
}

main() {
  check([], -1);
  check([pack(1.0), pack(2.0), pack(3.0)], -16);
}
