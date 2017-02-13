/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap.fromIterable(Iterable iterable,
 * {K key(element), V value(element), int compare(K key1, K key2),
 * bool isValidKey(potentialKey)})
 * The keys of the key/value pairs do not need to be unique. The last occurrence
 * of a [key] will simply overwrite any previous value.
 * @description Checks that this constructor creates an [SplayTreeMap] that
 * contains all elements of the [iterable]
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

check(Iterable expected, Map m2) {
  Expect.equals(expected.length, m2.length);
  expected.forEach((var element) {
    Expect.isTrue(m2.containsKey(element));
    Expect.equals(element, m2[element]);
  });
}

main() {
  SplayTreeMap map = new SplayTreeMap.fromIterable([]);
  check([], map);

  map = new SplayTreeMap.fromIterable([1, 2, 2, 2, 3, 4]);
  check([1, 2, 3, 4], map);

  map = new SplayTreeMap.fromIterable(["1", "2", "2", "2", "3", "4", "5", "6"]);
  check(["1", "2", "3", "4", "5", "6"], map);
}
