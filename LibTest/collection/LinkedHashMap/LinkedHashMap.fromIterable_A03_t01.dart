/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashMap.fromIterable(Iterable iterable,
 * {K key(element), V value(element)})
 * ...
 * The keys of the key/value pairs do not need to be unique. The last occurrence
 * of a key will simply overwrite any previous value.
 * @description Checks that the key/value pairs do not need to be unique
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

check(Iterable it, Iterable expected) {
  LinkedHashMap m = new LinkedHashMap.fromIterable(it);
  Expect.equals(expected.length, m.length);
  for (var v in expected) {
    Expect.equals(v, m[v]);
  }
}

main() {
  check([1, 1, 1, 1, 1, 2, 2, 2, 2], [1, 2]);
  check(["1", "1", "", "", ""], ["1", ""]);
  check([1, 1, 2, 2, 1, 2], [1, 2]);
}
