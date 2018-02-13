/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap([int compare(K key1, K key2),
 * bool isValidKey(potentialKey)])
 * Keys of the map are compared using the [compare] function passed in the
 * constructor, both for ordering and for equality.
 * @description Checks that [compare] function is really called when comparing
 * or ordering the keys.
 * .
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

class C {
  int value;
  C(this.value);
}

bool compared;

int compare(var key1, var key2) {
  compared = true;
  return key1.value - key2.value;
}

main() {
  SplayTreeMap map = new SplayTreeMap(compare);
  C c1 = new C(1);
  C c2 = new C(1);

  compared = false;
  map.containsKey(c1);
  Expect.isFalse(compared);

  map[c1] = 1;
  Expect.isFalse(compared);
  map.containsKey(c1);
  Expect.isTrue(compared);

  compared = false;
  var x = map[c1];
  Expect.isTrue(compared);

  compared = false;
  map.containsKey(c2);
  Expect.isTrue(compared);
}
