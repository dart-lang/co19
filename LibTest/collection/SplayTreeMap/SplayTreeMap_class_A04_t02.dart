/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap([int compare(K key1, K key2),
 * bool isValidKey(potentialKey)])
 * If the [compare] function is omitted, the objects are assumed to be
 * [Comparable], and are compared using their [Comparable.compareTo] method.
 * Non-comparable objects (including [null]) will not work as keys in that case.
 * @description Checks that if [compare] method is specified then
 * [Comparable.compareTo] is ignored during the comparison in [SplayTreeMap].
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

int compare(var key1, var key2) {
  return -1;
}

class C implements Comparable{
  int value;
  C(this.value);

  int compareTo(Object other) {
    return this.value - (other as C).value;
  }
}

main() {
  SplayTreeMap map = new SplayTreeMap(compare);
  C c1 = new C(1);
  C c2 = new C(1);

  map[c1] = 1;
  Expect.isFalse(map.containsKey(c2));
}
