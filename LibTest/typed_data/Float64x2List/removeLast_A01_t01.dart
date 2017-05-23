/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E removeLast()
 * Pops and returns the last object in this list.
 * Throws an UnsupportedError if this is a fixed-length list.
 * @description Checks that an UnsupportedError is thrown as Float64x2List is
 * fixed-length.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

check(List<Float64x2> list) {
  var l = new Float64x2List.fromList(list);
  var len = l.length;
  try {
    l.removeLast();
    Expect.fail("UnsupportedError is expected");
  } on UnsupportedError {}
  Expect.equals(len, l.length);
}

main() {
  check([]);
  check([f64x2(1.0), f64x2(2.0)]);
  check([f64x2(1.0), f64x2(3.0), f64x2(5.0), f64x2(7.0), f64x2(9.0)]);
}
