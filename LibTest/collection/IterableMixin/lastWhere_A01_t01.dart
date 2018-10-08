/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E lastWhere(bool test(E value), { E orElse() })
 * Returns the last element that satisfies the given predicate [test].
 * @description Checks that [lastWhere] returns last iterable element which
 * meets the [test] conditions.
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../../Utils/expect.dart";

class MyIterable extends Object with IterableMixin {
  List _content;
  MyIterable(List list): _content = list;

  Iterator get iterator {
    return _content.iterator;
  }
}

check(List list, bool test(value), int expected) {
  IterableMixin iterable = new MyIterable(list);
  int actual = iterable.lastWhere(test);
  Expect.equals(expected, actual);
}

main() {
  check([1, 2, -3, 4, 0], (value) => value > 1, 4);
  check(const[1, 2, -5, -6], (value) => value < 0, -6);
}
