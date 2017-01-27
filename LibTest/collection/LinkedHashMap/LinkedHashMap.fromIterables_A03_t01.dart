/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashMap.fromIterables(Iterable<K> keys, Iterable<V> values)
 * ...
 * It is an error if the two [Iterables] don't have the same length.
 * @description Checks that it is an error if the two [Iterables] don't have
 * the same length.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

check(Iterable keys, Iterable values) {
  Expect.throws(() {new LinkedHashMap.fromIterables(keys, values);});
}

main() {
  check([1, 2, 3], [1, 2, 3, 4]);
  check([1, 2, 3, 4], [1, 2, 3]);
  check([], [1, 2, 3]);
  check([1, 2, 3, 4], []);
  check([1, 2, 3, null, null], [1, 2, 3, 4]);
  check([1, 1, 1], [1]);
}
