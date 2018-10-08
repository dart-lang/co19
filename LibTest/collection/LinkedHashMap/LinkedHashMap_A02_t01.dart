/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashMap({bool equals(K key1, K key2), int hashCode(K key),
 * bool isValidKey(potentialKey)})
 * Creates an insertion-ordered hash-table based [Map].
 * @description Checks that LinkedHashMap preserves insertion order.
 * @author msyabro
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
