/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(Object element)
 * The equality used to determine whether [element] is equal to an element of
 * the iterable defaults to the [Object.operator==] of the element. The equality
 * used to determine whether [element] is equal to an element of the iterable
 * defaults to the [Object.operator==] of the element.
 * @description Checks that [true] is returned if collection contains [element]
 * and [false] is returned otherwise for integer numbers.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class MyIterable extends Object with IterableMixin {
  List _content;
  MyIterable(List list): _content = list;

  Iterator get iterator {
    return _content.iterator;
  }
}

main() {
  MyIterable iterable = new MyIterable([1, 2, 3, 4, 5, 6, 7, 8, 9]);

  Expect.isFalse(iterable.contains(null));
  for(int i = 1; i < 9; i++) {
    Expect.isTrue(iterable.contains(i));
    Expect.isFalse(iterable.contains(i + 10));
    Expect.isFalse(iterable.contains(i.toString()));
  }
}
