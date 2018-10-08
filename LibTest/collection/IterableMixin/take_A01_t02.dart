/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * Returns a lazy iterable of the [count] first elements of this iterable.
 * @description Checks that the filtering happens lazily, i.e. that [test]
 * method is not called when [take] is executed.
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

bool test(int value) {
  Expect.fail("test($value) called");
  return true;
}

main() {
  new MyIterable([]).take(3);
  new MyIterable([1]).take(0);
  new MyIterable([1, 3, 7, 4, 5, 6]).take(2);
}
