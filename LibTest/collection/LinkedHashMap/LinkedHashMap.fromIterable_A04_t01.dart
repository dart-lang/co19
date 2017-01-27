/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashMap.fromIterable(Iterable iterable,
 * {K key(element), V value(element)})
 * ...
 * If no values are specified for [key] and [value] the default is the identity
 * function
 * @description Checks that if no values are specified for key and value the
 * default is the identity function
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

class C {}

main() {
  var o1 = new Object();
  var o2 = new Object();
  C c1 = new C();
  C c2 = new C();

  check([o1, o2, c1, c2], [o1, o2, c1, c2]);
  check([null, null], [null]);
}
