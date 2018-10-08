/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap([int compare(K key1, K key2),
 * bool isValidKey(potentialKey)])
 * Keys of the map are compared using the [compare] function passed in the
 * constructor, both for ordering and for equality.
 * @description Checks that [compare] function works as expected.
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
  C c1 = new C(2);
  C c2 = new C(1);
  C c3 = new C(-1);
  C c4 = new C(1);

  map[c1] = 1;
  map[c2] = 2;
  map[c3] = 3;
  map[c4] = 4;

  Expect.equals(c3, map.firstKey());
  Expect.equals(c1, map.lastKey());
  Expect.equals(4, map[c2]);
  Expect.equals(4, map[c4]);
}
