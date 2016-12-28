/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HashMap({bool equals(K key1, K key2), int hashCode(K key),
 * bool isValidKey(potentialKey) })
 * If [equals] ... is omitted, the key's own [Object.operator==] is used
 * instead. Similar, if [hashCode] is ... omitted, the key's own
 * [Object.hashCode] is used.
 * @description Checks that if equals and hashCode methods are not provided,
 * [Object.operator==] and [Object.hashCode] are used when adding or updating
 * elements of [HashMap]
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
  HashMap map = new HashMap();
  Map aMap = new Map();
  List unexist = new List();

  for (int i = 0; i <= 40; i+=2) {
    aMap.putIfAbsent (i, () => i);
    unexist.add(i+1);
    map.putIfAbsent(i, () => i);
    check(map, aMap, unexist);
  }

  for (int i = 0; i <= 40; i+=2) {
    unexist.add(i+1);
    map.putIfAbsent(i, () => i + 1); // nothing should be actually added
    check(map, aMap, unexist);
  }

  aMap =
    {1 : 1, 6 : 6, 3 : [1, 2, 3], null : "abcd", "error" : new Error(),
      "null" : null, [0, 1] : "testme"};
  unexist = [-25, 484, "no there"];
  map = new HashMap();
  map.addAll(aMap);
  check(map, aMap, unexist);

  // Nothing should be actually added:
  map.putIfAbsent(1, () => "should not add");
  map.putIfAbsent(null, () => "should not add");
  map.putIfAbsent("abcd", () => "should not add");
  check(map, aMap, unexist);
}
