/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Copies into this array the elements from [src] in the given range.
 * @description Checks that IndexOutOfRangeException is thrown if count is larger than size of the source.
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
  } catch(IndexOutOfRangeException ok) {}
}

main() {
  check(2, 1, 2);
  check(44, 42, 44);
  check(6031769, 100500, 6031769);
}
