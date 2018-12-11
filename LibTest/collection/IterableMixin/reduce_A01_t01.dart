/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E reduce(E combine(E value, E element))
 * Reduces a collection to a single value by iteratively combining elements of
 * the collection using the provided function.
 * @description Checks that the result is correct for simple functions.
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

check(List list, num combine(value, element), num expected) {
  IterableMixin iterable = new MyIterable(list);
  num actual = iterable.reduce(combine);
  Expect.equals(expected, actual);
}	

main() {
  check([1, 2, -3], (value, element) => value + element, 0);
  check([1, 2, -3], (value, element) => value * element, -6);
  check([0, 2, -3], (value, element) => value * element, 0);
  check(const[1, 2, -5, -6],
      (value, element) => max(value, element), 2);
}
