/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool remove(Object value)
 * Removes the first occurrence of value from this list.
 * ...
 * An UnsupportedError occurs if the list is fixed-length.
 * @description Checks that an UnsupportedError is thrown as Float64x2List is
 * fixed-length.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

check(List<Float64x2> list, Float64x2 value) {
  var l = new Float64x2List.fromList(list);
  var len = l.length;
  try {
    l.remove(value);
    Expect.fail("UnsupportedError is expected");
  } on UnsupportedError {}
  Expect.equals(len, l.length);
}

main() {
  check([], f64x2(0.0));
  check([f64x2(1.0), f64x2(2.0)], f64x2(3.0));
  check([f64x2(1.0), f64x2(2.0)], f64x2(2.0));
  check([f64x2(1.0), f64x2(3.0), f64x2(5.0), f64x2(7.0), f64x2(9.0)],
      f64x2(0.0));
}
