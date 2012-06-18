/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [NullPointerException] if [start] or [length] is [:null:].
 * @description Checks that an [NullPointerException] throws 
 * if [start] or [length] is null.
 * @author vasya
 * @reviewer varlax
 */

void check(List l, int start, int length) {
  try {
    l.getRange(start, length);
    Expect.fail("NullPointerException expected when calling List.getRange()");
  } catch(NullPointerException ok) {}   
}

main() {
  check(new List(1),null,1);
  check(new List(1),0,null);
  check(new List(1),0,null);

  check([1],null,1);
  check([1],0,null);
  check([1],0,null);

  check(const [1],null,1);
  check(const [1],0,null);
  check(const [1],0,null);
}
