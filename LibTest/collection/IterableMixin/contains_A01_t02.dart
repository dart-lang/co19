/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(Object element)
 * The equality used to determine whether [element] is equal to an element of
 * the iterable defaults to the [Object.operator==] of the element. The equality
 * used to determine whether [element] is equal to an element of the iterable
 * defaults to the [Object.operator==] of the element.
 * @description Checks that <null> element is compared correctly.
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
  MyIterable iterable = new MyIterable([1, 2, 3, "testme", [1, 2, 3], null]);
  Expect.isTrue(iterable.contains(null));

  iterable = new MyIterable([1, 2, 3, "testme", [1, 2, 3]]);
  Expect.isFalse(iterable.contains(null));
}
