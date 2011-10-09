/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Copies into this array the elements from [src] in the given range.
 * @description Checks that IllegalArgumentException is thrown if count is negative.
 * @author iefremov
 * @reviewer msyabro
 * @needsreview
 */


void check(int dstSize, int srcSize, int count) {
  Array dst = new Array(dstSize);
  Array src = new Array(srcSize);
  try {
    dst.copyFrom(src, 0, 0, count);
    Expect.fail("expected IndexOutOfRangeException");
  } catch(IllegalArgumentException ok) {}
}

main() {
  check(2, 1, -1);
  check(44, 42, -2);
  check(6031769, 100500, -6031769);
}
