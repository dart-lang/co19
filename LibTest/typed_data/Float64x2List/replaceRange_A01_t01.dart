/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void replaceRange(int start, int end, Iterable<E> replacement)
 * Removes the objects in the range start inclusive to end exclusive and inserts
 * the contents of replacement in its place.
 * ...
 * This method does not work on fixed-length lists, even when replacement has
 * the same number of elements as the replaced range.
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
    l.replaceRange(0, 1, [f64x2(11.0)]);
    Expect.fail("UnsupportedError is expected");
  } on UnsupportedError {}
  Expect.equals(len, l.length);
  try {
    l.replaceRange(0, 0, [f64x2(12.0)]);
    Expect.fail("UnsupportedError is expected");
  } on UnsupportedError {}
  Expect.equals(len, l.length);
}

main() {
  check([]);
  check([f64x2(1.0)]);
  check([f64x2(1.0), f64x2(3.0), f64x2(5.0), f64x2(7.0), f64x2(9.0)]);
}
