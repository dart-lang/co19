/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interface HashSet<E>
 * HashSet({bool equals(E e1, E e2), int hashCode(E e),
 * bool isValidKey(potentialKey) })
 * If [equals] or [hashCode] are omitted, the set uses the elements' intrinsic
 * [Object.operator==] and [Object.hashCode]. ...
 * If neither [equals], [hashCode], nor [isValidKey] is provided, the default
 * [isValidKey] instead accepts all values. The default equality and hashcode
 * operations are assumed to work on all objects.
 * @description Checks that default [HashSet] implementation can contain
 * elements of different types including [null], and [Object.equals],
 * [Object.hashCode] functions are used for the comparison.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

check(HashSet set, List list1, List list2, List list3) {
  list1.forEach((element) => Expect.isTrue(set.contains(element)));
  list2.forEach((element) => Expect.isFalse(set.contains(element)));
}

main() {
  HashSet set = new HashSet();
  List aList = [-1, 0, 1, 2, 3, null, "test", "", [], [1, 2, null],
      {0 : 15, 1 : -9, 123 : "I am here"}, new Error()];
  set.addAll(aList);
  Expect.equals(aList.length, set.length);
  aList.forEach((element) => Expect.isTrue(set.contains(element)));
}
