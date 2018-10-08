/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> toSet()
 * The set may contain fewer elements than the iterable, if the iterable
 * contains an element more than once, or it contains one or more elements that
 * are equal. The order of the elements in the set is not guaranteed to be the
 * same as for the iterable.
 * @description Checks that proper Set is created.
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

void checkEquals(Iterable expected, Set actual) {
  Set set0 = new Set();
  for (var el in expected) {
    set0.add(el);
  }
  Expect.isTrue(set0.containsAll(actual));
  Expect.isTrue(actual.containsAll(set0));
}

main() {
  IterableMixin iterable = new MyIterable([]);
  Set res = iterable.toSet();
  Expect.equals(0, res.length);

  iterable = new MyIterable([1, "2", "3", "4", "5", "4", 1]);
  res = iterable.toSet();
  checkEquals(iterable, res);

  iterable = new MyIterable([null, [null], [], [1,2,3], [[null]]]);
  res = iterable.toSet();
  checkEquals(iterable, res);
}
