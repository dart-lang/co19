/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void addAll(Iterable<E> iterable)
 * Throws an UnsupportedError if this list is not extensible.
 * @description Checks that UnsupportedError is thrown
 * if the list is not extendable.
 * @author vasya
 * @reviewer iefremov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

void check(list, collection) {
  try {
    list.addAll(collection);
    Expect.fail("UnsupportedError expected when calling a.addAll()");
  } on UnsupportedError catch(ok) {}
}

main() {
  check(new List(100), ["1", "2", "3"]);
  check(new List.from(new List(0), growable:false), [null]);
  check(new List.filled(1, new List(1)), new List(34567));
  check(const [], new List(34567));
}
