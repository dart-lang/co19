/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> sublist(int start, [int end])
 * ...
 * An error occurs if start is outside the range 0 .. length or if end is
 * outside the range start .. length.
 * @description Checks that an error occurs if start is outside the range
 * 0 .. length, or if end is outside the range start .. length, or if
 * end < start.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  var list = [f64x2(6.0), f64x2(1.0), f64x2(4.0), f64x2(2.0), f64x2(5.0)];
  var l = new Float64x2List.fromList(list);

  Expect.throws(() {
    l.sublist(-1, 2);
  });

  Expect.throws(() {
    l.sublist(7, 2);
  });

  Expect.throws(() {
    l.sublist(1, 0);
  });

  Expect.throws(() {
    l.sublist(1, 7);
  });

  Expect.throws(() {
    l.sublist(4, 2);
  });
}
