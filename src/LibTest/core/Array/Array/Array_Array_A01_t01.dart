/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a new array of the given length.
 * @description Checks that created array contains exactly length elements.
 * @author iefremov
 * @reviewer msyabro
 */



void check(Array a, int size) {
  Expect.isTrue(size > 0);

  Expect.isTrue(a.length == size);

  a[size-1] = 1;
  Expect.isTrue(a[size-1] == 1);

  a[0] = 42;
  Expect.isTrue(a[0] == 42);

  a[size>>1] = 6031769;
  Expect.isTrue(a[size>>1] == 6031769);

  try {
    a[-1] = 0;
    Expect.fail("expected IndexOutOfRangeException");
  } catch(IndexOutOfRangeException ok) {}
  try {
    a[size] = 0;
    Expect.fail("expected IndexOutOfRangeException");
  } catch(IndexOutOfRangeException ok) {}
}

main() {
  Array a = new Array(0);
  Expect.isTrue(a.length == 0);
  try {
    a[0] = 1;
    Expect.fail("expected IndexOutOfRangeException");
  } catch(IndexOutOfRangeException ok) {}

  check(new Array(1), 1);
  check(new Array(42), 42);
  check(new Array(100500), 100500);
}
