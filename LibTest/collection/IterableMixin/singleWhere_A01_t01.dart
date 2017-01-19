/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E singleWhere(bool test(E value))
 * Returns the single element that satisfies [test].
 * Checks all elements to see if [test(element)] returns [true].
 * @description Checks that the single element that satisfies the given
 * predicate [test] is returned.
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

check(List a, bool test(value), int expected) {
  IterableMixin iterable = new MyIterable(a);
  int actual = iterable.singleWhere(test) as int;
  Expect.equals(expected, actual);
}

main() {
  check([1, 2, -3, 0], (value) => value > 1, 2);
  check(const[1, 2, -5, -6], (value) => value == 1, 1);
}
