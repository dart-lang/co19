/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion @assertion LinkedHashMap<K, V> abstract class
 * implements HashMap<K, V>
 * Changing a key's value, when the key is already in the map, does not change
 * the iteration order
 * @description Checks that iteration order does not change if key was updated.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

checkOrder(Map map, List keyOrder, List valuesOrder) {
  int idx = 0;
  for(var k in map.keys) {
    Expect.equals(keyOrder[idx++], k);
  }

  idx = 0;
  for(var v in map.values) {
    Expect.equals(valuesOrder[idx++], v);
  }
}

main() {
  LinkedHashMap map = new LinkedHashMap();
  List list = [1, 2, 3];
  map[1] = 1;
  map[2] = 2;
  map[list] = 28;
  map[4] = 4;

  checkOrder(map, [1, 2, list, 4], [1, 2, 28, 4]);

  list.add(12);
  checkOrder(map, [1, 2, list, 4], [1, 2, 28, 4]);

  list.removeAt(1);
  checkOrder(map, [1, 2, list, 4], [1, 2, 28, 4]);

  list.clear();
  checkOrder(map, [1, 2, list, 4], [1, 2, 28, 4]);

  list.add(128);
  checkOrder(map, [1, 2, list, 4], [1, 2, 28, 4]);
}
