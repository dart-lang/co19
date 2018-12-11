/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(Object element)
 * Some types of iterable may have a different equality used for its elements.
 * For example, a [Set] may have a custom equality (see [Set.identical]) that
 * its [contains] uses. Likewise the [Iterable] returned by a [Map.keys] call
 * should use the same equality that the [Map] uses for keys.
 * @description Checks that [true] is returned if collection contains [element]
 * and [false] is returned otherwise for set.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class MyIterable extends Object with IterableMixin {
  Set _content;
  MyIterable(Set set): _content = set;

  Iterator get iterator {
    return _content.iterator;
  }
}

check(HashSet set, List list1, List list2) {
  MyIterable iterable = new MyIterable(set);
  list1.forEach((element) => Expect.isTrue(iterable.contains(element)));
  list2.forEach((element) => Expect.isFalse(iterable.contains(element)));
}

main() {
  HashSet set = new HashSet(
      equals: (var key1, var key2) => key1 % 3 == key2 % 3,
      hashCode: (var e) => e % 3);

  set.add(0);
  check(set, [0], [1, 2, 4, 5, 7, 8]);

  set.add(3);
  check(set, [0], [1, 2, 4, 5, 7, 8]);

  set.add(7);
  check(set, [0, 7], [2, 5, 8]);

  set.add(4);
  check(set, [0, 7], [2, 5, 8]);

  set.add(14);
  check(set, [0, 7, 14], []);
}
