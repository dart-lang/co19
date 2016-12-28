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
 * @description This test checks [equals] method which always returns [false]:
 * it means that it should be impossible to add an element to the map.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

check(HashMap map, Map expected, List unexistent) {
  for(int i = 0; i < unexistent.length; i++) {
    Expect.isFalse(map.containsKey(unexistent[i]));
    Expect.equals(null, map[unexistent[i]]);
  }
}

main() {
  List list = [0, 1, 2, -3, -4, "testme", null];

  HashMap map = new HashMap(
      equals: (Object key1, Object key2) => false,
      hashCode: (dynamic e) => 12345);

  map.putIfAbsent(0, () => 0);
  check(map, {}, list);

  map.putIfAbsent(3, () => -23);
  check(map, {}, list);

  map.putIfAbsent(null, () => "abcd");
  check(map, {}, list);
}
