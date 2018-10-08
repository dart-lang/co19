/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap.fromIterable(Iterable iterable,
 * {K key(element), V value(element), int compare(K key1, K key2),
 * bool isValidKey(potentialKey)})
 * For each element of the [iterable] this constructor computes a key/value
 * pair, by applying [key] and [value] respectively.
 * @description Checks that for each element of the iterable this constructor
 * computes a key/value pair, by applying [key] and [value] respectively
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

check(Iterable expectedKeys, Iterable expectedValues, Map m2) {
  Expect.equals(expectedKeys.length, m2.length);
  for (int i = 0; i < expectedKeys.length; i++) {
    Expect.isTrue(m2.containsKey(expectedKeys.elementAt(i)));
    Expect.equals(expectedValues.elementAt(i), m2[expectedKeys.elementAt(i)]);
  }
}

int getKey(var element) => element * 2;
String getValue(var element) => "value=" + element.toString();

main() {
  SplayTreeMap map = new SplayTreeMap.fromIterable([],
      key: getKey, value: getValue);
  check([], [], map);

  map = new SplayTreeMap.fromIterable([1, 2, 3, 4],
      key: getKey, value: getValue);
  check([2, 4, 6, 8], ["value=1", "value=2", "value=3", "value=4"], map);
}
