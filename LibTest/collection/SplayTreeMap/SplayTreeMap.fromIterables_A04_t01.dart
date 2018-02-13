/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap.fromIterables(Iterable<K> keys, Iterable<V> values,
 * [int compare(K key1, K key2), bool isValidKey(potentialKey)])
 * @description Checks that if [compare] function specified, then it is used for
 * the keys comparison
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

bool compareCalled = false;

class C {
  int value;
  C(this.value);
}

int compare(C key1, C key2) {
  compareCalled = true;
  return key1.value - key2.value;
}

main() {
  C c1 = new C(2);
  C c2 = new C(2);
  Iterable<C> keys = [new C(1), c1, c2];
  Iterable<int> values = [1, 2, 3];
  SplayTreeMap<C, int> map = new SplayTreeMap<C, int>.fromIterables(keys, values, compare);

  Expect.equals(2, map.length);
  Expect.equals(3, map[c1]);
  Expect.equals(3, map[c2]);
  Expect.isTrue(compareCalled);
}
