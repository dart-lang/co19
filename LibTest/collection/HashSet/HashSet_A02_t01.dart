/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interface HashSet<E>
 * HashSet({bool equals(E e1, E e2), int hashCode(E e),
 * bool isValidKey(potentialKey) })
 * If the [equals] or [hashCode] methods won't work on all objects, but only on
 * some instances of [E], the [isValidKey] predicate can be used to restrict the
 * keys that the functions are applied to. Any key for which [isValidKey]
 * returns [false] is automatically assumed to not be in the set when asking
 * contains.
 * @description Checks that if [isValidKey] returns [false] given key is assumed
 * not to be in the set and so [equals] and [hashCode] methods are not called.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

int i = 0;

bool equals(Object key1, Object key2) {
  i++;
  return key1 == key2;
}

int hashCode (Object e) {
  i++;
  return e.hashCode;
}

check(HashSet set, List list1, List list2) {
  i = 0;
  list1.forEach((element) => Expect.isTrue(set.contains(element)));
  list2.forEach((element) => Expect.isFalse(set.contains(element)));
  Expect.equals(0, i);
}

main() {
  HashSet set = new HashSet(
    equals: (Object key1, Object key2) => key1 == key2,
    hashCode: (e) => e.hashCode,
    isValidKey: (Object key) => key is int && key >= 0);

  set.addAll([0, 1, -3, "abcd", 15, 38, new Error()]);
  check(set, [0, 1, 15, 38], [-3, null, "abcd", new Error()]);

  set.remove("abcd");
  check(set, [0, 1, 15, 38], [-3, null, "abcd", new Error()]);

  set.remove(1);
  check(set, [0, 15, 38], [1, -3, null, "abcd", new Error()]);
}
