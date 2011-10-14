/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Copies into this list the elements from [src] in the given range.
 * @description Checks that IndexOutOfRangeException is thrown if offset in dst is out of range.
 * @author iefremov
 * @reviewer msyabro
 */


void check(int dstSize, int srcSize, int dstOffset) {
  List dst = new List(dstSize);
  List src = new List(srcSize);
  try {
    dst.copyFrom(src, 0, dstOffset, 1);
    Expect.fail("expected IndexOutOfRangeException");
  } catch(IndexOutOfRangeException ok) {}   
}

main() {
  check(1, 1, 1);
  check(1, 1, -1);
  check(9, 9, 9);
  check(2, 42, -40);
}
