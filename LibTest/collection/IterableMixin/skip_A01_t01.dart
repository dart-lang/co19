/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skip(int count)
 * Returns an [Iterable] that provides all but the first [count] elements.
 * When the returned iterable is iterated, it starts iterating over this, first
 * skipping past the initial [count] elements.
 * After that, the remaining elements are iterated in the same order as in this
 * iterable.
 * @description checks that an [Iterable] that skips the first n elements is
 * returned.
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

check(List list, int n) {
  IterableMixin iterable = new MyIterable(list);
  Iterable result = iterable.skip(n);
  Expect.equals(iterable.length - n, result.length);
  int k = 0;
  for (var el in result) {
    Expect.equals(iterable.elementAt(n + k), el);
    k++;
  }      
}

main() {
  check([1, 2, -3, 4], 4);
  check([1, 2, -3, 4], 0);
  check([11, 2, -3, 4], 2);
  check([1, 22, -3, 4], 4);
  check(const[1, 2, -5, -6, 100], 0);
  check(const[1, -1, 2, -5, -6], 1);
  check(const[0, 0, 1, 2, -5, -6], 2);
  check(const[0, 0, 1, 2, -5, -6], 6);
}
