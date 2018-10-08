/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion @assertion LinkedHashMap<K, V> abstract class
 * implements HashMap<K, V>
 * The insertion order of keys is remembered, and keys are iterated in the order
 * they were inserted into the map.
 * @description Checks that [LinkedHashMap] preserves insertion order for keys.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

checkOrder(LinkedHashMap map, List list, dynamic key, dynamic value) {
  map[key] = value;
  list.add(key);
  int i = 0;
  for(var k in map.keys) {
    Expect.equals(list[i++], k);
  }
}

main() {
  LinkedHashMap map = new LinkedHashMap();
  List list = new List();
  checkOrder(map, list, 0, 1);
  checkOrder(map, list, 2, 2);
  checkOrder(map, list, "test", 3);
  checkOrder(map, list, "test1",  256);
  checkOrder(map, list, -23, -11);
  checkOrder(map, list, 4, 39);
  checkOrder(map, list, 1, "testme");
  checkOrder(map, list, 15, null);
  checkOrder(map, list, new Object(), new Object());
}
