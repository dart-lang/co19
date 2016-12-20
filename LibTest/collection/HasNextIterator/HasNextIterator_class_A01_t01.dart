/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [HasNextIterator] class wraps an [Iterator] and provides
 * methods to iterate over an object using [hasNext] and [next].
 * @description Checks that created object works as specified.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

void check (Iterable list) {
  HasNextIterator hnit = new HasNextIterator(list.iterator);
  Iterator it = list.iterator;
  for (;;) {
    bool hNext = hnit.hasNext;
    bool mNext = it.moveNext();
    Expect.equals(hNext, mNext);
    if (!mNext) {
      break;
    }
    Expect.equals(it.current, hnit.next());
  }
}
     
main() {
  check([]);
  check([1, 2, 3, 4, 0, 9, -1]);
  check(new Iterable.generate(0, (int index) => index * 5));
  check(new Iterable.generate(100, (int index) => index * 5));
}
