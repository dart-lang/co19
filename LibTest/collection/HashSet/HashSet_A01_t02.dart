/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interface HashSet<E>
 * HashSet({bool equals(E e1, E e2), int hashCode(E e),
 * bool isValidKey(potentialKey) })
 * Create a hash set using the provided [equals] as equality.
 * @description Checks that it's impossible to add an element which is already
 * equal to another element in the set.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

check(HashSet set, List list1, List list2, List list3) {
  list1.forEach((element) => Expect.isTrue(set.contains(element)));
  list2.forEach((element) => Expect.isFalse(set.contains(element)));
  Expect.equals(list3.length, set.length);
  for(int i = 0; i < list3.length; i++) {
    Expect.isTrue(list3[i] == set.elementAt(i));
  }
}

main() {
  HashSet set = new HashSet(
      equals: (var key1, var key2) => key1 % 3 == key2 % 3,
      hashCode: (var e) => e % 3);

  set.add(0);
  check(set, [0, 3, 6, 9], [1, 2, 4, 5, 7, 8], [0]);

  set.add(3);
  check(set, [0, 3, 6, 9], [1, 2, 4, 5, 7, 8], [0]);

  set .add(7);
  check(set, [0, 1, 3, 4, 6, 7, 9, 10, 12], [2, 5, 8], [0, 7]);

  set .add(4);
  check(set, [0, 1, 3, 4, 6, 7, 9, 10, 12], [2, 5, 8], [0, 7]);

  set.add(14);
  check(set,
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], [], [0, 7, 14]);
}
