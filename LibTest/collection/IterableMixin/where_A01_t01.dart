/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * Returns a new lazy [Iterable] with all elements that satisfy the predicate
 * [test].
 * The matching elements have the same order in the returned iterable as they
 * have in [iterator].
 * This method returns a view of the mapped elements.
 * @description Checks that all elements that satisfy [test] are retained,
 * and elements that do not, are skipped.
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

void check(IterableMixin iterable, bool test(var element)) {
  Iterator it0 = iterable.iterator;
  Iterator it = iterable.where(test).iterator;

  while (it0.moveNext()) {
    if (test(it0.current)) {
      Expect.isTrue(it.moveNext());
      Expect.equals(it0.current, it.current);
    }
  }
  Expect.isFalse(it.moveNext());
}

main() {
  IterableMixin iterable = new MyIterable([1, 3, 7, 4, 5, 6]);
  check(iterable, (var element) => element == 1);
  check(iterable, (var element) => true);
  check(iterable, (var element) => false);
  check(iterable, (var element) => element > 4);
  check(iterable, (var element) => element < 4);
  check(iterable, (var element) => element == 4);
}
