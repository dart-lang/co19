/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E reduce(E combine(E value, E element))
 * If it has only one element, that element is returned.
 * @description Checks that if there is only one element in the given iterable,
 * it is returned.
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

check(List list, combine, num expected) {
  IterableMixin iterable = new MyIterable(list);
  num actual = iterable.reduce(combine);
  Expect.equals(expected, actual);
}	

main() {
  check([1], (value, element) => value + element, 1);
  check([8], (value, element) => value * element, 8);
  check([-3], (value, element) => value * element, -3);
}
