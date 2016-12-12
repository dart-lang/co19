/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void setRange(int start, int end, Iterable<E> iterable,
 * [int skipCount = 0])
 * It is an error if start.. end is not a valid range pointing into the this.
 * @description Checks that RangeError is thrown if there is lack of space in
 * dst.
 * @author iefremov
 */
library setRange_A02_t01;

import "../../../Utils/expect.dart";

checkList(dst, dstOffset, count, src) {
  Expect.throws(() {dst.setRange(dstOffset, dstOffset+count, src, 0);},
      (e) => e is RangeError);
}

test(List create([int length])) {
  void check(int dstSize, int srcSize, int dstOffset, int count) {
    List src = create(srcSize);
    List dst = create(dstSize);
    checkList(dst, dstOffset, count, src);

    src = create();
    src.length = srcSize;
    dst = create();
    dst.length = dstSize;
    checkList(dst, dstOffset, count, src);
  }

  check(0, 1, 0, 1);
  check(41, 42, 0, 42);
  check(2, 2, 1, 2);
  check(10, 10, 9, 10);    
}
