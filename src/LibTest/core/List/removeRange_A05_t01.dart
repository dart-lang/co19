/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an [IndexOutOfRangeException] if [start] or
 * [:start + length:] are out of range.
 * @description Checks that an [IndexOutOfRangeException] is thrown
 * if [start] or [:start + length:] are out of range.
 * @author vasya
 * @reviewer varlax
 */

void check(int listSize, int start, int length) {
  List l = new List();
  l.length = listSize;
  try {
    l.removeRange(start, length);
    Expect.fail("IndexOutOfRangeException expected when calling List.removeRange()");
  } catch(IndexOutOfRangeException ok) {}   
}

main() {
  check(0,0,1);
  check(1,1,1);
  check(100,99,10);
  check(799, 0, 800);
}
