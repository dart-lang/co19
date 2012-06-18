/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an [UnsupportedOperationException] if the list is
 * not extendable.
 * @description Checks fixed size and immutable lists.
 * @author vasya
 * @reviewer varlax
 */

void check(List src, int start, int length) {
  try {
    src.insertRange(start, length);
    Expect.fail("UnsupportedOperationException expected when calling List.insertRange()");
  } catch(UnsupportedOperationException ok) {}   
}

main() {
  List l = new List(1);
  check(l, 0, 1);

  l = new List(5);
  check(l, 3, 10);

  l = new List(13667);
  check(l, 11100, 230000);

  check(const [1,2], 0,1);
}
