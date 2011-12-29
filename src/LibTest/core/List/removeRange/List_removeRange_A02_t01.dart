/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * Throws an [UnsupportedOperationException] if the list is
 * not extendable.
 * @description Checks that an [UnsupportedOperationException] is thrown as expected.
 * @author vasya
 * @reviewer varlax
 */

main() {
  var a = new List(1);
  try {
    a.removeRange(0, 1);
    Expect.fail("UnsupportedOperationException expected when calling List.removeRange()");
  } catch(UnsupportedOperationException ok) {}

  try {
    const[].removeRange(0, 1);
    Expect.fail("UnsupportedOperationException expected when calling List.removeRange()");
  } catch(UnsupportedOperationException ok) {}
}
