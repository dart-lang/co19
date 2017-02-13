/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap.fromIterable(Iterable iterable,
 * {K key(element), V value(element), int compare(K key1, K key2),
 * bool isValidKey(potentialKey)})
 * Creates a [SplayTreeMap] where the keys and values are computed from the
 * [iterable].
 * @description Checks that this constructor creates a [SplayTreeMap] that
 * contains all elements of the [iterable]
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

check(Iterable source, Map m2) {
  Expect.equals(source.length, m2.length);
  source.forEach((var element) {
    Expect.isTrue(m2.containsKey(element));
    Expect.equals(element, m2[element]);
  });
}

main() {
  Iterable source = [];
  SplayTreeMap map = new SplayTreeMap.fromIterable(source);
  check(source, map);

  source = [1, 2, 3, 4];
  map = new SplayTreeMap.fromIterable(source);
  check(source, map);

  source = ["1", "2", "3", "4", "5", "6"];
  map = new SplayTreeMap.fromIterable(source);
  check(source, map);
}
