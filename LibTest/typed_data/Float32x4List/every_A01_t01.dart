/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(E element))
 * Checks whether every element of this iterable satisfies [test].
 * Checks every element in iteration order, and returns false if any of them
 * make test return false, otherwise returns true.
 * @descriptionCheck that true is returned only if every element of the list
 * satisfies the predicate [f].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

bool pred(Float32x4 element) => element.x > 5.0 && element.w > 5.0;

Float32x4 pack(v) => new Float32x4.splat(v);

main() {
  var l;
  l = new Float32x4List.fromList([]);
  Expect.isTrue(l.every(pred));

  l = new Float32x4List.fromList([pack(1.0)]);
  Expect.isFalse(l.every(pred));

  l = new Float32x4List.fromList([
    pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(1.0), pack(2.0),
    pack(3.0), pack(4.0), pack(5.0)
  ]);
  Expect.isFalse(l.every(pred));

  l = new Float32x4List.fromList([pack(2.123e13)]);
  Expect.isTrue(l.every(pred));

  l = new Float32x4List.fromList(
      [pack(6.0), pack(7.0), pack(8.0), pack(9.0), pack(10.0)]);
  Expect.isTrue(l.every(pred));

  l = new Float32x4List.fromList(
      [pack(6.0), pack(7.0), pack(8.0), pack(9.0), pack(10.65e-20)]);
  Expect.isFalse(l.every(pred));
}
