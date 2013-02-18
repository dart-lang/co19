/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * Throws an [RangeError] if [start] is out of range.
 * @description Checks that an [RangeError] is thrown
 *  if [start] is out of range.
 * @author vasya
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

void check(List src, int start, int length) {
  
  try {
    src.insertRange(start, length);
    Expect.fail("RangeError expected when calling List.insertRange()");
  } on RangeError catch(ok) {}   
}

main() {
  List l = new List();
  check(l, 1, 1);

  l = [];
  l.length = 5;
  check(l, 6, 10);

  l = [1,2,3,4,5,6,7];
  check(l, -1, 2);

  l = new List.from([1,2,3,4,5,6,7]);
  check(l, -1, 2);
}
