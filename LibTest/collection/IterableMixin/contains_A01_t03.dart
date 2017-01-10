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
 * @description Checks that [true] is returned if collection contains [element]
 * and [false] is returned otherwise for list elements.
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
  List list1 = [1];
  List list2 = [2];
  List list3 = [3];
  MyIterable iterable = new MyIterable([list1, list2, list3]);

  Expect.isTrue(iterable.contains(list1));
  Expect.isTrue(iterable.contains(list2));
  Expect.isTrue(iterable.contains(list3));

  Expect.isFalse(iterable.contains([1]));
  Expect.isFalse(iterable.contains([2]));
  Expect.isFalse(iterable.contains([3]));
}
