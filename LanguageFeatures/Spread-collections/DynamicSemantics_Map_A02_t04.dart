/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A list literal <E>[elem_1 ... elem_n] is evaluated as follows:
 *
 * 2. For each entry in the map literal:
 *    i. If entry is a spread element:
 *       a. Evaluate the entry's expression to a value value.
 *       b. If entry is null-aware and value is [null], continue to the next
 *          entry in the literal.
 *       c. Evaluate [value.entries.iterator] to a value iterator.
 *       d. Loop:
 *          a. If [iterator.moveNext()] returns [false], exit the loop.
 *          b. Evaluate [iterator.current] to a value [newEntry].
 *          c. Call map[newEntry.key] = newEntry.value.
 *    ii. Else, entry has form [e1: e2]:
 *       a. Evaluate [e1] to a value key.
 *       b. Evaluate [e2] to a value value.
 *       c. Call map[key] = value.
 * @description Checks that elements are added to the result map
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../Utils/expect.dart";

class MapBaseImpl<K, V> extends MapBase<K, V> {
  ListQueue put_order = new ListQueue();
  LinkedHashMap<K, V> _map;
  MapBaseImpl(): _map = new LinkedHashMap<K, V>();
  MapBaseImpl.from(Map content): _map = new LinkedHashMap<K, V>.from(content);
  Iterable<K> get keys => _map.keys;
  V operator [](Object key) => _map[key];
  void operator []=(K key, V value) { _map[key] = value; }
  void clear() { _map.clear(); }
  V remove(Object key) => _map.remove(key);
}

List list = [123, 4];

Map map1 = new MapBaseImpl.from({1: 1, 2: 2, 3: 3, 4: 4, 5: 5});
Map map2 = new MapBaseImpl.from(
    {10: "a", 9: "14", 8: 1, 7: 2, 6: null});
Map map3 = new MapBaseImpl.from({10: 1, 20: 2, 30: map4, 40: list, 50: 14});
Map map4 = {};
Map map5 = null;

main() {
  Expect.mapEquals(
      {-1: 1, -2: 2, -3: 3, 1: 1, 2: 2, 3: 3, 4: 4, 5: 5, 6: 6, 7: 7},
      {-1: 1, -2: 2, -3: 3, ...map1, 6: 6, 7: 7});
  Expect.mapEquals(
      {6: 6, 7: 7, 1: 1, 2: 2, 3: 3, 4: 4, 5: 5, -1: 1, -2: 2, -3: 3},
      {6: 6, 7: 7, ...map1, -1: 1, -2: 2, -3: 3});

  Expect.mapEquals(
      {1: 1, 2: 2, 3: 3}, {1: 1, ...map4, 2: 2, ...?map4, 3: 3, ...?map5});

  Expect.mapEquals({-9: 9, -8: 8, 1: 1, 2: 2, 3: 3, 4: 4, 5: 5, -7: 7, 9: "14",
        8: 1, 7: 2, 6: null, -6: 6, 10: 1, 20: 2, 30: map4, 40: list,
        50: 14, -5: 5, -4: 4, -3: 3, -2: 2},
      {-9: 9, -8: 8, ...?map1, -7: 7, ...?map2, -6: 6, ...map3, -5: 5, -4: 4,
        ...map4, -3: 3, -2: 2});
}
