/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an out of bounds exception if the list is empty.
 * @description Checks that RangeError is thrown if the list is empty.
 * @author vasya
 * @reviewer msyabro
 * @reviewer varlax
 */

check(List a) {
  try {
    a.last;
    Expect.fail("RangeError expected when calling a.last");
  } on RangeError catch(ok) {}
}

main() {
  check(new List());
  check([]);
  check(const[]);
  check(new List.from([]));
}
