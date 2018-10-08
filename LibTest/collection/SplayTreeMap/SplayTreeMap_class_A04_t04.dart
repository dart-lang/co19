/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap([int compare(K key1, K key2),
 * bool isValidKey(potentialKey)])
 * If the [compare] function is omitted, the objects are assumed to be
 * [Comparable], and are compared using their [Comparable.compareTo] method.
 * Non-comparable objects (including [null]) will not work as keys in that case.
 * @description Checks that if [compare] function is not specified then [key]
 * object should implement [Comparable]. If not exception is thrown
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

class C {
}

main() {
  SplayTreeMap map = new SplayTreeMap();

  map[new C()] = null;
  Expect.throws(() { map[new C()] = null; });
}
