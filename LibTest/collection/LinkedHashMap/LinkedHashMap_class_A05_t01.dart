/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion @assertion LinkedHashMap<K, V> abstract class
 * implements HashMap<K, V>
 * Removing the key and adding it again will make it be last in the iteration
 * order.
 * @description Checks that removing a key and adding it again make it last in
 * the iteration order.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

checkOrder(LinkedHashMap map, List list) {
  Expect.equals(list.length, map.length);

  int i = 0;
  for(var k in map.keys) {
    Expect.equals(list[i++], k);
  }
  i = 0;
  for(var k in map.keys) {
    Expect.equals(list[i++], k);
  }
}

main() {
  LinkedHashMap map = new LinkedHashMap();
  List list = [];

  for (int i = 0; i < 100; i++) {
    map[i] = i;
    list.add(i);
  }

  checkOrder(map, list);
  map.remove(50);
  map[50] = 50;
  list.removeAt(50);
  list.add(50);
  checkOrder(map, list);

  map.remove(50);
  map[50] = 50;
  checkOrder(map, list);

  map.remove(0);
  map[0] = 0;
  list.removeAt(0);
  list.add(0);
  checkOrder(map, list);
}
