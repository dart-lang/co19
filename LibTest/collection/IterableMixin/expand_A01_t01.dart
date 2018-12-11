/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> expand <T>(Iterable<T> f(E element))
 * Expands each element of this [Iterable[ into zero or more elements.
 * @description Checks that all the elements from the iterable are expanded into
 * zero or more elements.
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
  MyIterable pairs = new MyIterable([[1, 2], [3, 4]]);
  List flattened = pairs.expand((pair) => pair).toList();
  Expect.listEquals([1, 2, 3, 4], flattened);

  MyIterable input = new MyIterable([1, 28, 9, 87, 11]);
  List duplicated = input.expand((i) => [i, i]).toList();
  Expect.listEquals([1, 1, 28, 28, 9, 9, 87, 87, 11, 11], duplicated);
}
