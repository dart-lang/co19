/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HashMap({bool equals(K key1, K key2), int hashCode(K key),
 * bool isValidKey(potentialKey) })
 * If using methods like [operator[]], [remove] and [containsKey] together with
 * a custom equality and hashcode, an extra [isValidKey] function can be
 * supplied.
 * This function is called before calling [equals] or [hashCode] with an
 * argument that may not be a [K] instance, and if the call returns [false], the
 * key is assumed to not be in the set. The [isValidKey] function defaults to
 * just testing if the object is a [K] instance.
 * @description Checks that if [isValidKey] function is provided, result map
 * contains only keys for which [isValidKey] returns [true]
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

check(HashMap map, Map expected, List unexistent) {
  expected.forEach((key, value) {
    Expect.isTrue(map.containsKey(key));
    Expect.equals(value, map[key]);
  });
  for(int i = 0; i < unexistent.length; i++) {
    Expect.isFalse(map.containsKey(unexistent[i]));
    Expect.equals(null, map[unexistent[i]]);
  }
}

main() {
  HashMap map = new HashMap(
      equals: (Object key1, Object key2) => true,
      hashCode: (e) => e,
      isValidKey: (Object key) => key is int && key > 0);

  map.addAll({0 : 0, 1 : 0, 2 : 12, -3 : 0, -4 : 0});
  check(map, {1 : 0, 2 : 12}, [0, -3, -4, null, 3, 4, 5, 6, 7]);

  map.putIfAbsent(7, () => 7);
  check(map, {1 : 0, 2 : 12, 7 : 7}, [0, -3, -4, "testme", null, 3, 4, 5, 6]);

  map.putIfAbsent(7, () => "I am here");
  check(map, {1 : 0, 2 : 12, 7 : 7}, [0, -3, -4, "testme", null, 3, 4, 5, 6]);

  map.remove(2);
  check(map, {1 : 0, 7 : 7}, [2, 0, -3, -4, "testme", null, 3, 4, 5, 6]);

  map.remove(-3);
  check(map, {1 : 0, 7 : 7}, [2, 0, -3, -4, "testme", null, 3, 4, 5, 6]);
}
