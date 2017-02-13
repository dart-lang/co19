/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap.fromIterables(Iterable<K> keys, Iterable<V> values,
 * [int compare(K key1, K key2), bool isValidKey(potentialKey)])
 * Creates a [SplayTreeMap] associating the given [keys] to [values].
 * @description Checks that created SplayTreeMap contains all elements of the
 * given [keys] and [values].
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

check(Iterable keys, Iterable values) {
  SplayTreeMap m = new SplayTreeMap.fromIterables(keys, values);
  Expect.equals(keys.length, m.length);
  for (int i = 0; i < keys.length; i++) {
    Expect.equals(values.elementAt(i), m[keys.elementAt(i)]);
  }
}

main() {
  check([1, 2, 3, 4, 5, 6, 7], ["1", "2", "3", "4", "5", "6", "7"]);
  check(["1", "2", "3", "4", "5", "6", "7"], [1, 2, 3, 4, 5, 6, 7]);
  check([], []);
}
