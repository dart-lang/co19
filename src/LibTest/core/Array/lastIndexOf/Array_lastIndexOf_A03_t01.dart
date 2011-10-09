/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an IndexOutOfRangeException if startIndex is
 * out of bounds.
 * @description Checks that the exception is thrown.
 * @author iefremov
 * @reviewer msyabro
 */


void check(int idx) {
  Array a = [42, 0, -1, 42, -1, 6031769, 0];
  try {
    a.indexOf(42, idx);
    Expect.fail("expected IndexOutOfRangeException");
  } catch(IndexOutOfRangeException ok){}

  try {
    a.indexOf(777, idx);
    Expect.fail("expected IndexOutOfRangeException");
  } catch(IndexOutOfRangeException ok){}

  try {
    a.indexOf(null, idx);
    Expect.fail("expected IndexOutOfRangeException");
  } catch(IndexOutOfRangeException ok){}

  try {
    a.indexOf(0, idx);
    Expect.fail("expected IndexOutOfRangeException");
  } catch(IndexOutOfRangeException ok){}
}

main() {
  check(-1);
  check(7);
  check(6031769);
  check(-6031769);
}
