/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int lastIndexOf(E element, [ int start ])
 * Returns the last index of element in this list.
 * Searches the list backwards from index start to 0.
 * The first time an object o is encountered so that o == element, the index of
 * o is returned.
 * ...
 * Returns -1 if element is not found.
 * @description Checks that -1 is returned if the element is not in this list.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  var l = new Float64x2List.fromList(
      [f64x2(1.0), f64x2(2.0), f64x2(2.0), f64x2(4.0), f64x2(5.0), f64x2(4.0)]);
  Expect.equals(-1, l.lastIndexOf(f64x2(0.0)));
  Expect.equals(-1, l.lastIndexOf(f64x2(1.0)));
  Expect.equals(-1, l.lastIndexOf(f64x2(2.0)));
  Expect.equals(-1, l.lastIndexOf(f64x2(4.0), 4));
  Expect.equals(-1, l.lastIndexOf(f64x2(5.0)));
  Expect.equals(-1, l.lastIndexOf(f64x2(6.0)));
}
