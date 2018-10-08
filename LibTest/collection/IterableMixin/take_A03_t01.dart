/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * The returned [Iterable] may contain fewer than [count] elements, if this
 * contains fewer than [count] elements.
 * @description Checks that if an [Iterable] contains less elements than
 * [count], all the elements are returned.
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "dart:math" as Math;
import "../../../Utils/expect.dart";

class MyIterable<int> extends Object with IterableMixin {
  List _content;
  MyIterable(List list): _content = list;

  Iterator get iterator {
    return _content.iterator;
  }
}

check(List list, int n, int expected) {
  IterableMixin iterable = new MyIterable(list);
  Iterable res = iterable.take(n);
  Expect.equals(Math.min(iterable.length, n), res.length);
  int k = 0;
  for (var el in res) {
    Expect.equals(iterable.elementAt(k), el);
    k++;
  }      
}

main() {
  check([1, 2, -3, 4], 6, 4);
  check([], 2, 0);
}
