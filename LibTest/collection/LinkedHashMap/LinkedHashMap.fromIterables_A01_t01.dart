/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashMap.fromIterables(Iterable<K> keys, Iterable<V> values)
 * Creates a [LinkedHashMap] associating the given [keys] to [values].
 *
 * This constructor iterates over [keys] and [values] and maps each element of
 * [keys] to the corresponding element of [values].
 * @description Checks that created hash map contains all elements of the given
 * [keys] and [values].
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

check(Iterable keys, Iterable values) {
  LinkedHashMap m = new LinkedHashMap.fromIterables(keys, values);
  Expect.equals(keys.length, m.length);
  for (int i = 0; i < keys.length; i++) {
    Expect.equals(values.elementAt(i), m[keys.elementAt(i)]);
  }
}

main() {
  check([1, 2, 3, 4, "5", 6, null, 7], [1, 2, 3, 4, 5, 6, 7, 8]);
  check([-1, 2.2, new Object(), "", "5", null, 0], [0, 0, 0, 0, 0, 0, 0]);
  check([], []);
}
