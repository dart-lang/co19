/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an [IndexOutOfRangeException] if
 * [startFrom] or [:startFrom + length:] are out of range for [from]
 * @description Checks that IndexOutOfRangeException is thrown if startFrom in src is out of range.
 * @author iefremov
 * @reviewer msyabro
 * @reviewer varlax
 */


void check(int dstSize, int srcSize, int startFrom) {
  List dst = new List(dstSize);
  List src = new List(srcSize);
  try {
    dst.setRange(0, 1, src, startFrom);
    Expect.fail("expected IndexOutOfRangeException");
  } catch(IndexOutOfRangeException ok) {}

  dst = new List();
  dst.length = dstSize;
  src = new List();
  src.length = srcSize;
  try {
    dst.setRange(0, 1, src, startFrom);
    Expect.fail("expected IndexOutOfRangeException");
  } catch(IndexOutOfRangeException ok) {}
}

main() {
  check(1, 1, 1);
  check(1, 1, -1);
  check(9, 9, 9);
  check(2, 42, -40);
  check(2, 42, 6031769);
}
