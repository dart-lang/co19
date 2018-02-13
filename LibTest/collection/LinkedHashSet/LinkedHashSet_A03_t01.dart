/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashSet({bool equals(E e1, E e2), int hashCode(E e),
 * bool isValidKey(potentialKey)})
 * Create an insertion-ordered hash set using the provided [equals] and
 * [hashCode]. The provided [equals] must define a stable equivalence relation,
 * and [hashCode] must be consistent with [equals]
 * @description Checks that if consistent [equals] and [hashCode] are provided,
 * they are used to compare the keys and produce hash value for keys
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

bool myEquals(var key1, var key2) =>
    key1 > 0 && key2 > 0 || key1 <= 0 && key2 <= 0;
int myHashCode(var key) => key > 0 ? 1 : -1;

check(LinkedHashSet set, List expected) {
  Expect.equals(expected.length, set.length);
  int i = 0;
  for(var v in expected) {
    Expect.equals(v, set.elementAt(i++));
  }
}

main() {
  LinkedHashSet set = new LinkedHashSet(equals: myEquals, hashCode: myHashCode);
  set.add(1);
  set.add(2);
  set.add(3);
  check(set, [1]);

  set.add(2);
  check(set, [1]);

  set.add(-2);
  check(set, [1, -2]);

  set.add(-20);
  check(set, [1, -2]);

  set.remove(10);
  set.add(15);
  check(set, [-2, 15]);
}
