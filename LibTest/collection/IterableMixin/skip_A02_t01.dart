/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable<E> skip(int count)
 * If this has fewer than [count] elements, then the resulting [Iterable] will
 * be empty.
 * @description Checks that if given [Iterable] has fewer than [count] elements,
 * then the resulting [Iterable] is empty.
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
  Expect.equals(0, result.length);
}

main() {
  check([], 1);
  check([1, 2, -3, 4], 5);
  check([11, 2, -3, 4], 200);
  check([1, 22, -3, 4], 400000);
  check(const[1, 2, -5, -6, 100], 5);
  check(const[1, -1, 2, -5, -6], 5);
  check(const[0, 0, 1, 2, -5, -6], 25);
  check(const[0, 0, 1, 2, -5, -6], 60000);
}