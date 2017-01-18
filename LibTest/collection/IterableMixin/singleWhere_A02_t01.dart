/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E singleWhere(bool test(E value))
 * Otherwise, if there are no matching elements, or if there is more than one
 * matching element, a [StateError] is thrown.
 * @description Checks that a [StateError] is thrown if no element match.
 * @author kaigorodov
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

check(List a, bool test(value)) {
  IterableMixin iterable = new MyIterable(a);
  Expect.throws(() { iterable.singleWhere(test); }, (e) => e is StateError);
}

main() {
  check([ 1, 2, -3, 4], (value) => value == 0);
  check(const[1, 2, -5, -6], (value) => value > 2);
}
