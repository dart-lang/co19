/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashMap({bool equals(K key1, K key2), int hashCode(K key),
 * bool isValidKey(potentialKey)})
 * Creates an insertion-ordered hash-table based [Map].
 * @description Checks that [inkedHashMap] preserves insertion order if [addAll]
 * is used to add elements to the map.
 * @author sgrekhov@unipro.ru
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

  map.addAll(new LinkedHashMap.fromIterables(["4", "5", "6"], [4, 5, 6]));
  checkOrder(map, ["1", "2", "3", "4", "5", "6"], [1, 2, 3, 4, 5, 6]);

  map.addAll(new LinkedHashMap.fromIterables(["1", "2", "3"], [11, 22, 33]));
  checkOrder(map, ["1", "2", "3", "4", "5", "6"], [11, 22, 33, 4, 5, 6]);

  map.addAll(new LinkedHashMap.fromIterables(["1", "2", "0"], [1, 2, 0]));
  checkOrder(map, ["1", "2", "3", "4", "5", "6", "0"], [1, 2, 33, 4, 5, 6, 0]);
}
