/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool test(E element))
 * Returns true if every elements of this collection satisfy
 * the predicate [test]. Returns false otherwise.
 * @descriptionCheck that true is returned only if every element
 * of the list satisfies the predicate [f].
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

pred(element) => element > 5.0;

main() {
  var l;
  l = new Float64List.fromList([]);
  Expect.isTrue(l.every(pred));

  l = new Float64List.fromList([1.0]);
  Expect.isFalse(l.every(pred));

  l = new Float64List.fromList([1.0, 2.0, 3.0, 4.0, 5.0, 1.0, 2.0, 3.0, 4.0, 5.0]);
  Expect.isFalse(l.every(pred));

  l = new Float64List.fromList([2.123e13]);
  Expect.isTrue(l.every(pred));

  l = new Float64List.fromList([6.0, 7.0, 8.0, 9.0, 10.0]);
  Expect.isTrue(l.every(pred));

  l = new Float64List.fromList([6.0, 7.0, 8.0, 9.0, 10.65e-20]);
  Expect.isFalse(l.every(pred));
}
