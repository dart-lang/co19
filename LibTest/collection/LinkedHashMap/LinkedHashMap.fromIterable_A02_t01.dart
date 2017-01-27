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
 * For each element of the [iterable] this constructor computes a key/value
 * pair, by applying [key] and [value] respectively.
 * @description Checks that created hash map contains all elements of [iterable]
 * Both empty and non-empty argument maps are tested.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

check(Iterable it) {
  LinkedHashMap m = new LinkedHashMap.fromIterable(it);
  Expect.equals(it.length, m.length);
  for (var v in it) {
    Expect.equals(v, m[v]);
  }
}

main() {
  check([1, 2, 3, 4, "5", 6, null, 7]);
  check([-1, 2.2, new Object(), "", "5", null, new Object()]);
  check([]);
}
