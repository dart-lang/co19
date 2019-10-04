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
 * @description Checks that elements in the null-aware spread element are added
 * to the result map if the element is not [null]
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

List myMaps = <Map>[{1: 1, 2: 2, 3: 3, 4: 4, 5: 5},
  {10: "a", 9: "14", 8: 1, 7: 2, 6: null, 5: 143, 4: [11]},
  {1: 1, 2: 2, 3: {}, 4: [123,4], 5: 14},
  {6: [], 5: [], 4: 12345},
  {}];

main() {
  myMaps.forEach((var m) {
    Map map = new MapBaseImpl.from(m);
    Expect.mapEquals(m, {...?map});
  });
}
