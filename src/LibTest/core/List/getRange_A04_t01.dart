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

void check(List l, int start, int length) {
  try {
    l.getRange(start, length);
    Expect.fail("IndexOutOfRangeException expected when calling List.getRange()");
  } catch(IndexOutOfRangeException ok) {}   
}

main() {
  check(new List(0),0,1);
  check(new List(10),1,10);
  check(new List(1099),0,1100);
  check(new List(10789), 10000, 10000);

  List l = new List();
  check(l,0,1);
  l.length = 10;
  check(l,1,10);
  l.length = 1099;
  check(l,0,1100);
  l.length = 10789;
  check(l, 10000, 10000);

  l = [];
  check(l,0,1);
  l.length = 10;
  check(l,1,10);
  l.length = 1099;
  check(l,0,1100);
  l.length = 10789;
  check(l, 10000, 10000);
}
