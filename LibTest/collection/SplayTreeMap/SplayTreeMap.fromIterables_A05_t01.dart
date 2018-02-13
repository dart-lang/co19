/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap.fromIterables(Iterable<K> keys, Iterable<V> values,
 * [int compare(K key1, K key2), bool isValidKey(potentialKey)])
 * @description Checks that if [isValidKey] function is specified, then it is
 * called before the [compare] call
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

bool isValidKeyCalled = false;
bool startTesting = false;

class C {
  int value;
  C(this.value);
}

int compare(C key1, C key2) {
  if (startTesting) {
    Expect.isTrue(isValidKeyCalled);
  }
  return key1.value - key2.value;
}

bool isValidKey(potentialKey) {
  if (startTesting) {
    isValidKeyCalled = true;
  }
  return true;
}

main() {
  C c1 = new C(1);
  C c2 = new C(2);
  Iterable<C> keys = [c1, c2];
  Iterable<int> values = [1, 2];
  SplayTreeMap<C, int> map = new SplayTreeMap<C, int>.fromIterables(keys, values, compare,
      isValidKey);

  startTesting = true;
  isValidKeyCalled = false;
  map[c1];
  isValidKeyCalled = false;
  map[c2];
  isValidKeyCalled = false;
  map.containsKey(c2);
  isValidKeyCalled = false;
  map.remove(c1);
}
