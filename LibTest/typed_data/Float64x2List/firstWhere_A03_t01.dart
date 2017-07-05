/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E firstWhere(bool test(E element), {E orElse()})
 * ...
 * If orElse is omitted, it defaults to throwing a StateError.
 * @description Checks that if orElse is omitted and no elements satisfy test,
 * a StateError is thrown.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  var l = new Float64x2List.fromList([
    f64x2(5.0), f64x2(6.0), f64x2(7.0), f64x2(8.0), f64x2(9.0), f64x2(10.0),
    f64x2(11.0), f64x2(12.0), f64x2(13.0), f64x2(14.0), f64x2(15.0),
    f64x2(16.0), f64x2(17.0)
  ]);
  try {
    l.firstWhere((element) => element.x > 20);
    Expect.fail("StateError is expected");
  } on StateError {}
}
