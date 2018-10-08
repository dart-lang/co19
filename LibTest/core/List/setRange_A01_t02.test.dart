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
 * @description Checks that all needed elements are copied.
 * @author iefremov
 */
library setRange_A01_t02;

import "../../../Utils/expect.dart";

check(dst) {
  List src = [dst, null];
  src[1] = src;

  dst.setRange(0, 2, src);
  Expect.listEquals([dst, src, null, null, null], dst);

  dst.setRange(4, 5, src);
  Expect.listEquals([dst, src, null, null, dst], dst);

  dst.setRange(2, 4, src);
  Expect.listEquals([dst, src, dst, src, dst], dst);
}

test(List create([int length])) {
  check(create(5));

  List a = create();
  a.length = 5;
  check(a);
}
