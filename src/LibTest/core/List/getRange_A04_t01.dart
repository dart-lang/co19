/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an [IndexOutOfRangeException] if [start] or
 * [:start + length:] are out of range.
 * @description Checks that an [IndexOutOfRangeException] throws 
 * if [start] or [:start + length:] are out of range.
 * @author vasya
 * @reviewer varlax
 */

void check(int listSize, int start, int length) {
  List l = new List();
  l.length = listSize;
  try {
    l.getRange(start, length);
    Expect.fail("IndexOutOfRangeException expected when calling List.getRange()");
  } catch(IndexOutOfRangeException ok) {}   
}

main() {
  check(0,0,1);
  check(10,1,10);
  check(1099,0,1100);
  check(10789, 10000, 10000);
}
