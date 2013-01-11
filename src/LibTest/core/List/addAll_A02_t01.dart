/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws UnsupportedError if the list is not extendable.
 * @description Checks that UnsupportedError is thrown
 * if the list is not extendable.
 * @author vasya
 * @reviewer iefremov
 * @reviewer varlax
 */

void check(list, collection) {
  try {
    list.addAll(collection);
    Expect.fail("UnsupportedError expected when calling a.addAll()");
  } on UnsupportedError catch(ok) {}
}

main() {
  check(new List.fixedLength(100), ["1", "2", "3"]);
  check(new List.fixedLength(0), [null]);
  check(new List.fixedLength(1), new List(34567));
  check(const [], new List(34567));
}
