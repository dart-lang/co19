/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> toList({bool growable: true})
 * The list is fixed-length if [growable] is [false].
 * @description Checks that the list created with [growable == true] can change
 * its size.
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

void check(List l) {
  int len = l.length;
  l.add(null);
  Expect.equals(len + 1, l.length);

  l.clear();
  Expect.equals(0, l.length);
}

main() {
  IterableMixin iterable = new MyIterable([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  check(iterable.toList());
}
