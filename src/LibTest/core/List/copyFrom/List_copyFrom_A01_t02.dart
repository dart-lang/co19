/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Copies into this list the elements from [src] in the given range.
 * @description Checks that IndexOutOfRangeException is thrown if there is lack of space in dst.
 * @author iefremov
 * @reviewer msyabro
 * @needsreview
 */


void check(int dstSize, int srcSize, int dstOffset, int count) {
  List src = new List(srcSize);
  List dst = new List(dstSize);
  try {
    dst.copyFrom(src, 0, dstOffset, count);
    Expect.fail("expected IndexOutOfRangeException");
  } catch(IndexOutOfRangeException ok) {}
}

main() {
  check(0, 1, 0, 1);
  check(41, 42, 0, 42);
  check(2, 2, 1, 2);
  check(10, 10, 9, 10);    
}
