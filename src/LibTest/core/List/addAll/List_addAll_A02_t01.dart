/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws UnsupportedOperationException if
 * the list is not extendable.
 * @description Checks that UnsupportedOperationException is thrown
 * if the list is not extendable.
 * @author vasya
 * @reviewer iefremov
 * @needsreview
 */

void check(list, collection) {
    try {
      list.addAll(collection);
      Expect.fail("UnsupportedOperationException expected when calling a.addAll()");
    } catch(UnsupportedOperationException ok) {}
}

main() {
  check(new List(100), ["1", "2", "3"]);
  check(new List(0), [null]);
  check(new List(1), new List(34567));
}
