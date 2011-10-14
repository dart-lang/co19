/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws a [UnsupportedOperationException] if the list is not extendable.
 * @description Checks that the exception is thrown.
 * @author vasya
 * @reviewer msyabro
 */

main() {
  List a = new List(100);
  try {
    a.length = 1;
    Expect.fail("UnsupportedOperationException expected when calling a.length");
  } catch( UnsupportedOperationException ok ) {}
}
