/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws a [UnsupportedOperationException] if the list is not extendable.
 * @description Checks that a [UnsupportedOperationException] exception is thrown
 * if the list is not extendable.
 * @author vasya
 * @reviewer msyabro
 * @reviewer varlax
 */

main() {
  List a = new List(0);
  try {
    a.addLast(null);
    Expect.fail("UnsupportedOperationException expected when calling a.push()");
  } catch(UnsupportedOperationException ok) {}

  try {
    new List(100).addLast(null);
    Expect.fail("UnsupportedOperationException expected when calling a.add()");
  } catch(UnsupportedOperationException ok) {}
}
