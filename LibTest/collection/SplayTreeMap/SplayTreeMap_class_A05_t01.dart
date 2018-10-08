/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap([int compare(K key1, K key2),
 * bool isValidKey(potentialKey)])
 * To allow calling operator[], [remove] or [containsKey] with objects that are
 * not supported by the [compare] function, an extra [isValidKey] predicate
 * function can be supplied. This function is tested before using the [compare]
 * function on an argument value that may not be a [K] value.
 * @description Checks that if [isValidKey] is supplied it is called before
 * [compare] call
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

int compare(var key1, var key2) {
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
  SplayTreeMap map = new SplayTreeMap(compare, isValidKey);
  C c1 = new C(1);
  C c2 = new C(2);

  map[c1] = 1;
  map[c2] = 2;

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
