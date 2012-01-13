/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * Throws an [IndexOutOfRangeException] if [start] or
 * [:start + length:] are out of range for [:this:].
 * @description Checks that IndexOutOfRangeException is thrown if there is lack of space in dst.
 * @author iefremov
 * @reviewer msyabro
 * @reviewer varlax
 */


void check(int dstSize, int srcSize, int dstOffset, int count) {
  List src = new List(srcSize);
  List dst = new List(dstSize);
  try {
    dst.setRange(dstOffset, count, src, 0);
    Expect.fail("expected IndexOutOfRangeException");
  } catch(IndexOutOfRangeException ok) {}

  src = new List();
  src.length = srcSize;
  dst = new List();
  dst.length = dstSize;
  try {
    dst.setRange(dstOffset, count, src, 0);
    Expect.fail("expected IndexOutOfRangeException");
  } catch(IndexOutOfRangeException ok) {}
}

main() {
  check(0, 1, 0, 1);
  check(41, 42, 0, 42);
  check(2, 2, 1, 2);
  check(10, 10, 9, 10);    
}
