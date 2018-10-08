/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap.from(Map other, [int compare(K key1, K key2),
 * bool isValidKey(potentialKey)])
 * Creates a [SplayTreeMap] that contains all key/value pairs of [other].
 * @description Checks that this constructor creates a [SplayTreeMap] that
 * contains all elements of [other]
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

check(Map m1, Map m2) {
  Expect.equals(m1.length, m2.length);
  m1.forEach((var key, var value) {
    Expect.isTrue(m2.containsKey(key));
    Expect.equals(value, m2[key]);
  });
}

main() {
  Map source = {};
  SplayTreeMap map = new SplayTreeMap.from(source);
  check(source, map);

  source = {1: 1, 2: 2, 3: "3", 4: null};
  map = new SplayTreeMap.from(source);
  check(source, map);

  source = {"1": 1, "2": 2, "3": 3, "4": null, "5": 5, "6": 6};
  map = new SplayTreeMap.from(source);
  check(source, map);
}
