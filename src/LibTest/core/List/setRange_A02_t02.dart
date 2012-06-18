/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * Throws an [IndexOutOfRangeException] if [start] or
 * [:start + length:] are out of range for [:this:].
 * @description Checks that IndexOutOfRangeException is thrown if [start] 
 * is out of range in [:this:].
 * @author varlax
 * @reviewer iefremov
 */

checkList(dst, dstOffset, count, src) {
  try {
    dst.setRange(dstOffset, count, src, 0);
    Expect.fail("expected IndexOutOfRangeException");
  } catch(IndexOutOfRangeException ok) {}
}

void check(int dstSize, int srcSize, int dstOffset, int count) {
  List src = new List(srcSize);
  List dst = new List(dstSize);
  checkList(dst, dstOffset, count, src);

  src = new List();
  src.length = srcSize;
  dst = new List();
  dst.length = dstSize;
  checkList(dst, dstOffset, count, src);

  src = [];
  src.length = srcSize;
  dst = [];
  dst.length = dstSize;
  checkList(dst, dstOffset, count, src);

  src = new List.from([]);
  src.length = srcSize;
  dst = new List.from([]);
  dst.length = dstSize;
  checkList(dst, dstOffset, count, src);
}

main() {
  check(0, 1, -1, 1);
  check(41, 42, -54, 42);
  check(2, 2, 11, 2);
  check(10, 10, 10, 10);    
}
