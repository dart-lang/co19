/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Iterable map(dynamic f(E element))
 * Iterating multiple times over the returned [Iterable] will invoke the
 * supplied function [f] multiple times on the same element.
 * @description Checks that iterating multiple times over the the returned
 * [Iterable] will invoke the supplied function [f] multiple times on the same
 * element.
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

List<int> visited = new List<int>(200);

int f(var element) {
  visited[element]++;
  return element;
}

void check(IterableMixin queue, int expected) {
  int count = 0;
  Iterable mapIter = queue.map(f);
  for (int el in mapIter) {
    count++;
  }
  Expect.equals(queue.length, count);
  for (int k = 0; k < 200; k++) {
    Expect.equals(expected, visited[k]);
  }
}

main() {
  List list = new List<int>();
  for (int k = 0; k < 200; k++) {
    list.add(k);
    visited[k] = 0;
  }
  IterableMixin iterable = new MyIterable(list);

  check(iterable, 1);
  check(iterable, 2);
  check(iterable, 3);
}
