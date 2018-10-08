/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E lastWhere(bool test(E value), { E orElse() })
 * If no element satisfies [test] ... . If [orElse] is omitted, it defaults to
 * throwing a [StateError].
 * @description Checks that [StateError] is thrown if there are no elements
 * corresponding [test] and [orElse] function is omitted.
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

check(List list) {
  IterableMixin iterable = new MyIterable(list);
  Expect.throws(() {
    iterable.lastWhere((value) => false);
  }, (e) => e is StateError);}

main() {
  check([1, 2, -3, 4, 0]);
  check(const[1, 2, -5, -6]);
  check([null, 1, 2, 3, -1, new Error(), [1, 2, 3]]);
}
