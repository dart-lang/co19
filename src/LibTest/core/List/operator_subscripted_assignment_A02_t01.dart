/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an out of bounds exception if [index] is out of bounds.
 * @description Checks that the exception is thrown, for fixed size and growable arrays.
 * @author iefremov
 * @author varlax
 * @reviewer msyabro
 * @reviewer varlax
 */

void check(List a, int idx) {
  try {
    a[idx] = null;
    Expect.fail("expected RangeError");
  } on RangeError catch(ok) {}
}

main() {
  check([], 0);
  check([], 1);
  check([], -1);
  check(new List(), 6031769);
  check(new List(123), 6031769);
  check(new List.from([1]), 2);
  check(new List.from([null,null,null,null]), 5);
  check(new List.from([null,null,null,null]), -1);
}
