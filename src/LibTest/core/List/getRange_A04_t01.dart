/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable<E> getRange(int start, int end)
 * The result of this function is backed by this.
 * It is an error if the start and end are not valid ranges at the time of the call to this method.
 * @description Checks that an error is thrown if the start and end are not valid ranges.
 * @author vasya
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

void check(List l, int start, int length) {
  try {
    l.getRange(start, start+length);
    Expect.fail("RangeError expected when calling List.getRange()");
  } on RangeError catch(ok) {}   
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
