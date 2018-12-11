/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic fold(initialValue, combine(previousValue, E element))
 * Reduces a collection to a single value by iteratively combining each
 * [element] of the collection with an existing value.
 * Uses [initialValue] as the initial value, then iterates through the elements
 * and updates the [value] with each element using the [combine] function.
 * @description Checks that the result of folding is correct.
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "dart:math";
import "../../../Utils/expect.dart";

class MyIterable extends Object with IterableMixin {
  List _content;
  MyIterable(List list): _content = list;

  Iterator get iterator {
    return _content.iterator;
  }
}

check(List list, num init, num combine(value, element), num expected) {
  IterableMixin iterable = new MyIterable(list);
  num actual = iterable.fold(init, combine);
  Expect.equals(expected, actual);
}	

main() {
  check([1, 2, -3], 0, (value, element) => value + element, 0);
  check([1, 2, -3], 1, (value, element) => value * element, -6);
  check([0, 2, -3], 1, (value, element) => value * element, 0);
  check(const[1, 2, -5, -6], -1000,
      (value, element) => max(value, element), 2);
}
