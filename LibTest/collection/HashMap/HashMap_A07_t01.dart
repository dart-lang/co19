/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HashMap({bool equals(K key1, K key2), int hashCode(K key),
 * bool isValidKey(potentialKey) })
 * If neither [equals], [hashCode], nor [isValidKey] is provided, the default
 * [isValidKey] instead accepts all keys. The default equality and hashcode
 * operations are assumed to work on all objects.
 * @description Checks that default [isValidKey] function accepts all the keys
 * if [equals] and [hashCode] functions are not provided.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Map map = {0 : 0, null : "null", "null" : null, new Object() : -3,
      new Error() : "error", [] : "empty", [1, 2, 3] : 6, {0 : 1} : 1};
  HashMap hashmap = new HashMap();
  hashmap.addAll(map);
  map.forEach((key, value) {
    Expect.isTrue(hashmap.containsKey(key));
    Expect.equals(value, hashmap[key]);
  });
}
