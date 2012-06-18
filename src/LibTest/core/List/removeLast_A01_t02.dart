/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an [IndexOutOfRangeException] if the list is empty.
 * @description Checks that exception is thrown as expected.
 * @author vasya
 * @reviewer msyabro
 * @reviewer varlax
 */

check(a) {
  try {
    a.removeLast();
    Expect.fail("IndexOutOfRangeException expected when calling a.removeLast()");
  } catch( IndexOutOfRangeException ok ) {}
}

main() {
  check(new List());
  check([]);
  check(new List.from([]));
}