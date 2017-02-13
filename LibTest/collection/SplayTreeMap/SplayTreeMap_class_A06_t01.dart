/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap([int compare(K key1, K key2),
 * bool isValidKey(potentialKey)])
 * If omitted, the [isValidKey] function defaults to testing if the value is a
 * [K].
 * @description Checks that [isValidKey] defaults to test that the [key] is a
 * [K] object
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

class C {
  int value;
  C(this.value);
}

int compare(C key1, C key2) {
  return key1.value - key2.value;
}

main() {
  SplayTreeMap<C, Object> map = new SplayTreeMap<C, Object>(compare);
  C c1 = new C(1);
  C c2 = new C(2);
  C c3 = new C(3);

  map[c1] = 1;
  map[c2] = 2;
  map[c3] = 3;

  Expect.isNull(map["12345"]);
  Expect.isFalse(map.containsKey(12));
  Expect.isNull(map.remove(new Object()));
}
