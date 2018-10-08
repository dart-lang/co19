/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HashMap({bool equals(K key1, K key2), int hashCode(K key),
 * bool isValidKey(potentialKey) })
 * If [equals] is provided, it is used to compare the keys in the table with new
 * keys. Similar, if [hashCode] is provided, it is used to produce a hash
 * value for keys in order to place them in the hash table.
 * @description This test checks division-to-3-reminder hash code: in this case
 * there are only three hashes in the map: 0, 1 and 2.
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
  HashMap map = new HashMap<int, int>(
      equals: (int key1, int key2) => key1 % 3 == key2 % 3,
      hashCode: (int e) => e % 3);

  map.putIfAbsent(0, () => 0);
  check(map, {0 : 0, 3 : 0, 6 : 0, 9 : 0}, [1, 2, 4, 5, 7, 8]);

  map.putIfAbsent(1, () => 1);
  check(map, {0 : 0, 1 : 1, 3 : 0, 4 : 1, 6 : 0, 7 : 1, 9 : 0}, [2, 5, 8]);

  map.putIfAbsent(2, () => 2);
  for (int i = 0; i <= 10; i++) {
    map.putIfAbsent(i, () => i);
    check(map,
        {0 : 0, 1 : 1, 2 : 2, 3 : 0, 4 : 1, 5 : 2, 6 : 0, 7 : 1, 8 : 2, 9 : 0},
        []);
  }

  map.putIfAbsent(2, () => 0);
  check(map,
      {0 : 0, 1 : 1, 2 : 2, 3 : 0, 4 : 1, 5 : 2, 6 : 0, 7 : 1, 8 : 2, 9 : 0},
      []);

  map.putIfAbsent(3, () => null);
  check(map,
      {0 : 0, 1 : 1, 2 : 2, 3 : 0, 4 : 1, 5 : 2, 6 : 0, 7 : 1, 8 : 2, 9 : 0},
      []);
}
