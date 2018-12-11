/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HashMap({bool equals(K key1, K key2), int hashCode(K key),
 * bool isValidKey(potentialKey) })
 * The [isValidKey] function defaults to just testing if the object is a [K]
 * instance.
 * @description Checks that default [isValidKey] function checks if the object
 * is a [K] instance. This means that [equals] and [hashCode] functions are
 * never called when trying to call [containsKey] or [remove] for unsupported
 * keys.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

int i = 0;
bool equals(dynamic key1, dynamic key2) {
  i++;
  return key1 == key2;
}

int hashCode(dynamic key) {
  i++;
  return key;
}

main() {
  HashMap<int, int> map =
      new HashMap<int, int>(equals: equals, hashCode: hashCode);
  map.addAll({0: 0, 1: 0, 2: 12, -3: 0, -4: 0});

  i = 0;
  bool j = map.containsKey(null);
  Expect.equals(0, i);
  j = map.containsKey("string");
  Expect.equals(0, i);
  int k = map["abcd"];
  Expect.equals(0, i);
  map.remove([]);
  Expect.equals(0, i);
}
