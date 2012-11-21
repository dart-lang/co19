/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [Error] if [start] or [length] is [:null:].
 * @description Checks that exception is thrown as expected.
 * @author vasya
 * @reviewer varlax
 */

void check(List l, int start, int length) {
  try {
    l.removeRange(start, length);
    Expect.fail("Error expected when calling List.removeRange()");
  } on Error catch(ok) {}   
}

main() {
  check(new List(),null,1);
  check(new List(),0,null);
  check(new List(),0,null);

  check(new List.from([]),null,1);
  check(new List.from([]),0,null);
  check(new List.from([]),0,null);

  check([],null,1);
  check([],0,null);
  check([],0,null);
}
