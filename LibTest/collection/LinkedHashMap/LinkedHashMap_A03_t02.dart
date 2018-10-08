/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashMap({bool equals(K key1, K key2), int hashCode(K key),
 * bool isValidKey(potentialKey)})
 * If [equals] is provided, it is used to compare the keys in the table with new
 * keys. If [equals] is omitted, the key's own [Object.operator==] is used
 * instead. Similar, if [hashCode] is provided, it is used to produce a hash
 * alue for keys in order to place them in the hash table. If it is omitted, the
 * key's own [Object.hashCode] is used.
 * @description Checks that if [equals] and [hashCode] are omitted then
 * [Object.operator==] and [Object.hashCode] are used
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class C {
  int get hashCode => 1;
  bool operator ==(Object c) {
    return true;
  }
}

main() {
  LinkedHashMap map1 = new LinkedHashMap(equals: identical,
      hashCode: identityHashCode);
  LinkedHashMap map2 = new LinkedHashMap();

  C key1 = new C();
  C key2 = new C();
  C key3 = new C();

  map1[key1] = 1;
  map1[key2] = 2;
  map1[key3] = 3;

  map2[key1] = 1;
  map2[key2] = 2;
  map2[key3] = 3;

  Expect.equals(3, map1.length);
  Expect.equals(1, map2.length);
}
