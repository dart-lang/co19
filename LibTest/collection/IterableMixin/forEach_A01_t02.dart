/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  void forEach(void f(E element))
 * Applies the function [f] to each element of this collection in iteration
 * order.
 * @description Checks [forEach()] on empty iterable.
 */

import "dart:collection";
import "../../../Utils/expect.dart";

class MyIterable extends Object with IterableMixin {
  List _content;
  MyIterable(List list): _content = list;

  Iterator get iterator {
    return _content.iterator;
  }
}

check(List list, num init, combine, num expected) {
  IterableMixin iterable = new MyIterable(list);
  num actual = iterable.fold(init, combine);
  Expect.equals(expected, actual);
}	

main() {
  IterableMixin iterable = new MyIterable([]);

  int count = 0;
  iterable.forEach((var element) {
    count++;
  });

  Expect.isTrue(count == 0);

}
