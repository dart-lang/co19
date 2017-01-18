/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Iterable map(dynamic f(E element))
 * As long as the returned [Iterable] is not iterated over, the supplied
 * function [f] will not be invoked.
 * @description Checks that the supplied function [f] will not be invoked if the
 * returned [Iterable] is not iterated over.
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

bool invoked = false;

f(var element) {
  invoked = true;
  return element;
}

main() {
  IterableMixin iterable = new MyIterable([0, 2, 3, 3, 4, 5]);
  iterable.map(f);
  Expect.isFalse(invoked);
}
