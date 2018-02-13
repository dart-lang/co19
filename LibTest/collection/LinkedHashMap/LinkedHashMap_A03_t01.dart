/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashMap({bool equals(K key1, K key2), int hashCode(K key),
 * bool isValidKey(potentialKey)})
 * ...
 * If [equals] is provided, it is used to compare the keys in the table with new
 * keys. If [equals] is omitted, the key's own [Object.operator==] is used
 * instead. Similar, if [hashCode] is provided, it is used to produce a hash
 * alue for keys in order to place them in the hash table. If it is omitted, the
 * key's own [Object.hashCode] is used.
 * @description Checks that if both [equals] and [hashCode] are provided, they
 * are used to compare the keys and produce hash values.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

bool myEquals(var key1, var key2) =>
    key1 > 0 && key2 > 0 || key1 <= 0 && key2 <= 0;
int myHashCode(var key) => key > 0 ? 1 : -1;

check(LinkedHashMap map, List keysExpected, List valuesExpected) {
  Expect.equals(keysExpected.length, map.keys.length);
  Expect.equals(valuesExpected.length, map.values.length);
  int i = 0;
  for(var k in map.keys) {
    Expect.equals(keysExpected[i++], k);
  }
  i = 0;
  for(var v in map.values) {
    Expect.equals(valuesExpected[i++], v);
  }
}

main() {
  LinkedHashMap map = new LinkedHashMap(equals: myEquals, hashCode: myHashCode);
  map[1] = 11;
  map[2] = 22;
  map[3] = 33;
  check(map, [1], [33]);

  map[2] = 55;
  check(map, [1], [55]);

  map[-2] = 100;
  check(map, [1, -2], [55, 100]);

  map[-20] = 200;
  check(map, [1, -2], [55, 200]);

  map.remove(10);
  map[15] = 66;
  check(map, [-2, 15], [200, 66]);
}
