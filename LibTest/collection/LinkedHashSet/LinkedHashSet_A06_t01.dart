/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashMap({bool equals(K key1, K key2), int hashCode(K key),
 * bool isValidKey(potentialKey)})
 * If [isValidKey] is omitted, it defaults to testing if the object is an [E]
 * instance. That means that:
 *   new LinkedHashSet<int>(equals: (int e1, int e2) => (e1 - e2) % 5 == 0,
 *   hashCode: (int e) => e % 5)
 * does not need an [isValidKey] argument, because it defaults to only accepting
 * [int] values which are accepted by both [equals] and [hashCode].
 * @description Checks that [isValidKey] is not specified, it defaults to test
 * if the object is of [K] type or not.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  LinkedHashSet set = new LinkedHashSet<int>(
    equals: (int e1, int e2) => true,
    hashCode: (int e) => 1);

  LinkedHashSet set1 = new LinkedHashSet(
      equals: (e1, e2) => true,
      hashCode: (e) => 1);

  set.add(12);
  set1.add(12);

  Expect.isTrue(set.contains(12));
  Expect.isTrue(set.contains(0));
  Expect.isTrue(set.contains(-123));

  Expect.isFalse(set.contains("abcd"));
  Expect.isFalse(set.contains(null));
  Expect.isFalse(set.contains(new Object()));

  Expect.isTrue(set1.contains(12));
  Expect.isTrue(set1.contains(0));
  Expect.isTrue(set1.contains(-123));

  Expect.isTrue(set1.contains("abcd"));
  Expect.isTrue(set1.contains(null));
  Expect.isTrue(set1.contains(new Object()));
}
