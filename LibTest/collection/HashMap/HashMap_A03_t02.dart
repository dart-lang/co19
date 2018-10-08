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
 * @description This test checks [equals] method which always returns [true]: it
 * means that only zero or one element can be in the map.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

check(HashMap map, Map expected, List unexistent) {
  expected.forEach((key, value) {
    Expect.isTrue(map.containsKey(key));
    Expect.equals(value, map[key]);
  });
}

main() {
  Map aMap = {0 : 0, 1 : 0, 2 : 0, -3 : 0, -4 : 0, "testme" : 0, null : 0};

  HashMap map = new HashMap(
      equals: (Object key1, Object key2) => true,
      hashCode: (dynamic e) => 12345);

  map.putIfAbsent(0, () => 0);
  check(map, aMap, []);

  map.putIfAbsent(3, () => -23);
  check(map, aMap, []);

  map.putIfAbsent(null, () => -23);
  check(map, aMap, []);
}
