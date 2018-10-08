/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap.fromIterable(Iterable iterable,
 * {K key(element), V value(element), int compare(K key1, K key2),
 * bool isValidKey(potentialKey)})
 * @description Checks that if [isValidKey] supplied and returns [false] then
 * element is assumed not to be in a map
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

bool isValidKey(var potentialKey) => potentialKey.value != 3;

main() {
  C c1 = new C(1);
  C c2 = new C(2);
  C c3 = new C(3);

  Iterable source = [c1, c2, c3];
  SplayTreeMap map = new SplayTreeMap.fromIterable(source, compare: compare,
      isValidKey: isValidKey);

  Expect.equals(3, map.length);
  Expect.isNull(map[c3]);
  Expect.isFalse(map.containsKey(c3));
  Expect.isNull(map.remove(c3));
}
