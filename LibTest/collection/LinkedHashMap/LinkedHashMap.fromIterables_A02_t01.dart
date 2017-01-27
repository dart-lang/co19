/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashMap.fromIterables(Iterable<K> keys, Iterable<V> values)
 * ...
 * If [keys] contains the same object multiple times, the last occurrence
 * overwrites the previous value.
 * @description Checks that if [keys] contains the same object multiple times,
 * the last occurrence overwrites the previous value.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

check(Iterable keys, Iterable keysExpected, Iterable values,
    Iterable valuesExpected) {
  LinkedHashMap m = new LinkedHashMap.fromIterables(keys, values);
  Expect.equals(keysExpected.length, m.length);
  for (int i = 0; i < keysExpected.length; i++) {
    Expect.equals(valuesExpected.elementAt(i), m[keysExpected.elementAt(i)]);
  }
}

main() {
  check([1, 2, 1, 1], [1, 2], [1, 2, 3, 4], [4, 2]);
  check([1, 1, 1, 1], [1], [1, 2, 3, 4], [4]);
  check([1, 1, null, null], [1, null], [1, 2, 3, 4], [2, 4]);
}
