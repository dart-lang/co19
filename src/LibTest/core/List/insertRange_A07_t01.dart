/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [NullPointerException] if [start] or [length] is [:null:].
 * @description Checks that an [NullPointerException] is thrown
 * if [start] or [length] is null.
 * @author vasya
 * @reviewer varlax
 */

void check(List l, int start, int length) {  
  try {
    l.insertRange(start, length);
    Expect.fail("NullPointerException expected when calling List.insertRange()");
  } catch(NullPointerException ok) {}   
}

main() {
  check(new List(), null, 1);
  check(new List(), 1, null);
  check(new List(), null, null);

  check([], null, 1);
  check([], 1, null);
  check([], null, null);

  check(new List.from([]), null, 1);
  check(new List.from([]), 1, null);
  check(new List.from([]), null, null);
}
