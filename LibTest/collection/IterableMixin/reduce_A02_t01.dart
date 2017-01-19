/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E reduce(E combine(E value, E element))
 * The iterable must have at least one element.
 * @description Checks that error state exception is thrown if queue is empty.
 * @author iarkh@unipro.ru
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

test (combine, element) {
  return combine + element;
}

main() {
  IterableMixin iterable = new MyIterable([]);
  Expect.throws(() { iterable.reduce(test); }, (e) => e is StateError);
}
