/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Hash map version of the Map<K,V> interface
 * that preserves insertion order.
 * @description Checks that LinkedHashMap preserves insertion order.
 * @author msyabro
 * @reviewer pagolubev
 */

checkOrder(Map map, List keyOrder, List valuesOrder) {
  Expect.listEquals(keyOrder, map.keys);
  Expect.listEquals(valuesOrder, map.values);
}

main() {
  LinkedHashMap map = new LinkedHashMap();
  map["1"] = 1;
  map["2"] = 2;
  map["3"] = 3;
  checkOrder(map, ["1", "2", "3"], [1, 2, 3]);

  map["2"] = 5;
  checkOrder(map, ["1", "2", "3"], [1, 5, 3]);

  map.remove("2");
  map["2"] = 10;
  checkOrder(map, ["1", "3", "2"], [1, 3, 10]);

  map.remove("3");
  checkOrder(map, ["1", "2"], [1, 10]);

  map["4"] = 4;
  checkOrder(map, ["1", "2", "4"], [1, 10, 4]);
}
