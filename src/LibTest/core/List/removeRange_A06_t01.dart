/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [NullPointerException] if [start] or [length] is [:null:].
 * @description Checks that exception is thrown as expected.
 * @author vasya
 * @reviewer varlax
 */

void check(List l, int start, int length) {
  try {
    l.removeRange(start, length);
    Expect.fail("NullPointerException expected when calling List.removeRange()");
  } catch(NullPointerException ok) {}   
}

main() {
  check(null,0,1);
  check(new List(),null,1);
  check(new List(),0,null);
  check(new List(),0,null);
}
