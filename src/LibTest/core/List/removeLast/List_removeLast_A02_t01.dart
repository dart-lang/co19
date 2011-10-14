/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws a [UnsupportedOperationException] if the length of the
 * list cannot be changed.
 * @description Checks that [UnsupportedOperationException] exception is thrown
 * if the length of the list cannot be changed.
 * @author vasya
 * @reviewer msyabro
 */

main() {
  List a = new List(1);
  a[0] = 0;
  try {
    a.removeLast();
    Expect.fail("UnsupportedOperationException expected when calling a.removeLast()");
  } catch( UnsupportedOperationException ok ) {}
}
