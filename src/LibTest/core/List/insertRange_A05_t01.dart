/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an [IllegalArgumentException] if [length] is negative.
 * @description Checks that an [IllegalArgumentException] is thrown
 * if [length] is negative.
 * @author vasya
 * @reviewer varlax
 */

void check(List src, int start, int length) {
  
  try {
    src.insertRange(start, length);
    Expect.fail("IllegalArgumentException expected when calling List.insertRange()");
  } catch(IllegalArgumentException ok) {}   
}

main() {
  List l = new List();
  check(l, 0, -1);

  l = new List();
  l.length = 5;
  check(l, 3, -10);

  l = [1,2,3,4,5,6,7];
  check(l, 7, -2);

  l = new List.from([1,2,3,4,5,6,7]);
  check(l, 7, -2);
}
