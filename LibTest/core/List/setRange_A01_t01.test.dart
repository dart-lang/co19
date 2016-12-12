/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void setRange(int start, int end, Iterable<E> iterable,
 * [int skipCount = 0])
 * Copies the elements of iterable, skipping the skipCount first elements into
 * the range start to end exclusive of this.
 * If start equals end and represent a legal range, this method has no effect.
 * It is an error if start.. end is not a valid range pointing into the this.
 * It is an error if the iterable does not have enough elements after skipping
 * skipCount elements.
 * @description Checks trivial copying: 0 and 1 elements.
 * @author iefremov
 */
library setRange_A01_t01;

import "../../../Utils/expect.dart";

class A{A(){}}

test(List create([int length])) {
  var a = new A();
  List dst = create(1);
  dst.setRange(0, 1, [a], 0);
  Expect.isTrue(dst[0] == a);
  Expect.identical(dst[0], a);
  Expect.isTrue(dst.length == 1);

  //zero case
  dst = create(0);
  dst.setRange(0, 0, []);
  Expect.isTrue(dst.length == 0);
}
