/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap.fromIterables(Iterable<K> keys, Iterable<V> values,
 * [int compare(K key1, K key2), bool isValidKey(potentialKey)])
 * If keys contains the same object multiple times, the last occurrence
 * overwrites the previous value.
 * @description Checks that created SplayTreeMap contains all elements of the
 * given [keys] and [values].
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

check(Iterable keys, Iterable keysExpected, Iterable values,
    Iterable valuesExpected) {
  SplayTreeMap m = new SplayTreeMap.fromIterables(keys, values);
  Expect.equals(keysExpected.length, m.length);
  for (int i = 0; i < keysExpected.length; i++) {
    Expect.equals(valuesExpected.elementAt(i), m[keysExpected.elementAt(i)]);
  }
}

main() {
  check([1, 2, 1, 1], [1, 2], [1, 2, 3, 4], [4, 2]);
  check([1, 1, 1, 1], [1], [1, 2, 3, 4], [4]);
  check(["1", "1", "2", "2"], ["1", "2"], [1, 2, 3, 4], [2, 4]);
}
