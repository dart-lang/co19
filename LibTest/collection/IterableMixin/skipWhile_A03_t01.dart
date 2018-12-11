/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * Every new [Iterator] of the returned [Iterable[ iterates over all elements of
 * this.
 * @description Checks that for every new iterator, all elements either are
 * tested and satisfy the test, or are returned by the iterator.
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

void check(List list, bool test(var element)) {
  IterableMixin iterable = new MyIterable(list);
  List all = [];
  bool test1(var element) {
    bool res = test(element);
    if (res) {
      all.add(element);
    }
    return res;
  }
  Iterable res = iterable.skipWhile(test1);

  for (int k = 0; k < 5; k++) {
    all = [];
    Iterator it = res.iterator;
    while (it.moveNext()) {
      all.add(it.current);
    }
    Expect.listEquals(list, all);
  }
}

main() {
  List list = [1, 3, 7, 4, 5, 6];
  check(list, (var element) => element == 1);
  check(list, (var element) => true);
  check(list, (var element) => false);
  check(list, (var element) => element > 4);
  check(list, (var element) => element < 4);
  check(list, (var element) => element == 4);
}
