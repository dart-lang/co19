/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap([int compare(K key1, K key2),
 * bool isValidKey(potentialKey)])
 * ...
 * If the map contains only the key [a], then [map.containsKey(b)] will return
 * [true] if and only if [compare(a, b) == 0], and the value of [a == b] is not
 * even checked.
 * @description Checks that if [compare(a, b) == 0] then [map.containsKey(b)]
 * returns [true]
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

class C {
  int value;
  C(this.value);
}

int compare(var key1, var key2) {
  return key1.value - key2.value;
}

main() {
  SplayTreeMap map = new SplayTreeMap(compare);
  C c1 = new C(1);
  C c2 = new C(1);

  map[c1] = 1;
  Expect.isTrue(map.containsKey(c2));
}
