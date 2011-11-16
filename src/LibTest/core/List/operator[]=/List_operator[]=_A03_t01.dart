/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [IllegalArgumentException] if [index] is [:null:].
 * @description Checks that the exception is thrown, for fixed size and growable arrays.
 * @author varlax
 * @reviewer msyabro
 */

void check(List a) {
  try {
    a[null] = new Object();
    Expect.fail("expected IllegalArgumentException");
  } catch(IllegalArgumentException ok) {}
}

main() {
  check([]);
  check(new List());
  check(new List(123));
  check(new List.from([1]));
  check(new List.from([null,null,null,null]));
}
