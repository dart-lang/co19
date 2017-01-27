/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashMap.fromIterable(Iterable iterable,
 * {K key(element), V value(element)})
 * Creates a [LinkedHashMap] where the keys and values are computed from the
 * [iterable].
 * @description Checks that if [key] and [value] functions specified then they
 * are used for computing elements of this [iterable].
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

key(element) => element * 2;
value(element) => element * 3;

check(Iterable it) {
  LinkedHashMap m = new LinkedHashMap.fromIterable(it, key: key, value: value);
  Expect.equals(it.length, m.length);
  for (var v in it) {
    Expect.equals(v * 3, m[v * 2]);
  }
}

main() {
  check([]);
  check([-1, 1, 2, 3, 4, 0, 17]);
}
