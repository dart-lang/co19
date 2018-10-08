/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap.from(Map other, [int compare(K key1, K key2),
 * bool isValidKey(potentialKey)])
 * Creates a [SplayTreeMap] that contains all key/value pairs of [other].
 * @description Checks that if [compare] function specified, then it is used for
 * keys comparison
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

class C {
  int value;
  C(this.value);
}

int compare(var key1, var key2) {
  return key1.value - key2.value;
}

main() {
  Map source = {new C(1): 1, new C(2): 2, new C(2): 3};
  SplayTreeMap map = new SplayTreeMap.from(source, compare);

  Expect.equals(2, map.length);
  Expect.equals(3, map[new C(2)]);
}
