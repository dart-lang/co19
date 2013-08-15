/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool any(bool f(E element))
 * Returns true if one element of this collection satisfies
 * the predicate [test]. Returns false otherwise.
 * @description Checks that true is returned if one or more
 * elements satisfies the predicate f, false otherwise.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

pred(element) => element > 5;

main() {
  var l;
  l = new Uint16List.fromList([]);
  Expect.isFalse(l.any(pred));

  l = new Uint16List.fromList([1]);
  Expect.isFalse(l.any(pred));

  l = new Uint16List.fromList([1, 2, 3, 4, 5, 1, 2, 3, 4, 5]);
  Expect.isFalse(l.any(pred));

  l = new Uint16List.fromList([100]);
  Expect.isTrue(l.any(pred));

  l = new Uint16List.fromList([6, 7, 8, 9, 10]);
  Expect.isTrue(l.any(pred));

  l = new Uint16List.fromList([1, 2, 3, 6, 4, 5]);
  Expect.isTrue(l.any(pred));
}
