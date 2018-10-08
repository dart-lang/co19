/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashMap.from(Map other)
 * Creates a [LinkedHashMap<K,V>] that contains all key value pairs of [other].
 * @description Checks that created hash map contains all elements of [other].
 * Both empty and non-empty argument maps are tested.
 * @author msyabro
 */
import "../../../Utils/expect.dart";
import "dart:collection";

check(Map m1, Map m2) {
  Expect.equals(m1.length, m2.length);
  m1.forEach((var key, var value) {
    Expect.isTrue(m2.containsKey(key));
    Expect.equals(value, m2[key]);
  });
}

main() {
  Map m = {"1": 1, "2": 2, "3": 3, "4": 4};
  LinkedHashMap map = new LinkedHashMap.from(m);
  check(m, map);

  m = new Map();
  map = new LinkedHashMap.from(m);
  Expect.isTrue(map.isEmpty);
}
