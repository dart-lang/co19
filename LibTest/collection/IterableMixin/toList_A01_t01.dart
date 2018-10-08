/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> toList({bool growable: true})
 * Creates a [List] containing the elements of this [Iterable].
 * The elements are in iteration order.
 * @description Checks created list contains all the iterable elements in
 * iteration order.
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

void checkEquals(Iterable expected, List actual) {
  Expect.equals(expected.length, actual.length);
  Iterator it = expected.iterator;
  var i = 0;
  while (it.moveNext()) {
    Object o = it.current;
    Expect.identical(actual[i], o);
    Expect.isTrue(actual[i] == o);
    i++;
  }
}

main() {
  IterableMixin iterable = new MyIterable([]);
  List list = iterable.toList();
  Expect.equals(0, list.length);

  iterable = new MyIterable(["1", "2", "3", "4", "5"]);
  list = iterable.toList();
  checkEquals(iterable, list);

  iterable = new MyIterable([null, [null], [], [1,2,3], [[null]]]);
  list = iterable.toList();
  checkEquals(iterable, list);
}
