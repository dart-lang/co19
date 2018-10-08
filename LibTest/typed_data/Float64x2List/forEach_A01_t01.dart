/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(E element))
 * Applies the function f to each element of this collection in iteration order.
 * @description Checks that the function f is applied for each element of list.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  var l = new Float64x2List.fromList([]);
  var res = f64x2(1.0);
  l.forEach((el) => res += el );
  Expect.equals(1.0, res.x);
  Expect.equals(1.0, res.y);

  l = new Float64x2List.fromList([
    f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0), f64x2(6.0)
  ]);
  res = f64x2(0.0);
  l.forEach((el) => res += el );
  Expect.equals(21.0, res.x);
  Expect.equals(21.0, res.y);
}
