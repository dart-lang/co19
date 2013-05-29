/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void removeRange(int start, int end)
 * It is an error if start.. end is not a valid range pointing into the this.
 * @description Checks that an [RangeError] is thrown
 * if [start] or [end] are out of range.
 * @author vasya
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

checkList(l, start, end) {
  try {
    l.removeRange(start, end);
    Expect.fail("RangeError expected when calling List.removeRange()");
  } on RangeError catch(ok) {}
}

void check(int listSize, int start, int end) {
  List l = new List();
  l.length = listSize;
  checkList(l, start, end);

  l = [];
  l.length = listSize;
  checkList(l, start, end);

  l = new List.from([]);
  l.length = listSize;
  checkList(l, start, end);
}

main() {
  check(0,0,1);
  check(1,1,2);
  check(100,99,101);
  check(799, 0, 800);
}
