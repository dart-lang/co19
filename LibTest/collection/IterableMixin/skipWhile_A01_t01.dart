/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * Returns an [Iterable] that skips leading elements while [test] is satisfied.
 * @description Checks that all first elements that satisfy [test] are removed,
 * and elements after are retained.
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../../Utils/expect.dart";

class MyIterable<int> extends Object with IterableMixin {
  List _content;
  MyIterable(List list): _content = list;

  Iterator get iterator {
    return _content.iterator;
  }
}

void check(List list, bool test(var element)) {
  IterableMixin iterable = new MyIterable(list);
  Iterator it0 = iterable.iterator;
  Iterator it = iterable.skipWhile(test).iterator;
  int skipCount = 0;
  
  // skip manually
  bool hasNext0;
  while ((hasNext0 = it0.moveNext()) && test(it0.current)) {
    skipCount++;
  }

  // check that the rest of a0 is identical to a
  int len = 0;
  for (;;) {
    bool hasNext = it.moveNext();
    Expect.equals(hasNext0, hasNext);
    if (!hasNext0) {
      break;
    }
    len++;
    Expect.equals(it0.current, it.current);
    hasNext0 = it0.moveNext();
  }
  Expect.equals(list.length - skipCount, len);
}

main() {
  List list = [1, 3, 7, 4, 5, 6];
  check(list, (var element) => element == 1);
  check(list, (var element) => true);
  check(list, (var element) => false);
  check(list, (var element) => element > 4);
  check(list, (var element) => element < 4);
  check(list, (var element) => element == 4);
}
