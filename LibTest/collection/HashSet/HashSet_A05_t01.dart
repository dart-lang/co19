/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interface HashSet<E>
 * HashSet({bool equals(E e1, E e2), int hashCode(E e),
 * bool isValidKey(potentialKey) })
 * Likewise, if [equals] is [identical], [hashCode] is [identityHashCode] and
 * [isValidKey] is omitted, the resulting set is identity based, and the
 * [isValidKey] defaults to accepting all keys. Such a map can be created
 * directly using [HashSet.identity].
 * @description Checks that default [isValidKey] function accepts all the keys
 * if [equals] and [hashCode] functions are not provided for [HashSet.identity]
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  String aString = "string";
  Object anObject = new Object();
  Error anError = new Error();
  Map aMap = {0 : 1};
  List aList = [1, 2, 3];

  List list = [0, null, aString, anObject, anError, aMap, aList];
  List notIdentical = [2, -5, "string1" "str" + "ing", new Object(),
      new Error(), {0 : 1}, {}, [], [1, 2, 3]];

  HashSet hashset = new HashSet.identity();
  hashset.addAll(list);

  list.forEach((element) => Expect.isTrue(hashset.contains(element)));
  notIdentical.forEach((element) => Expect.isFalse(hashset.contains(element)));
}
