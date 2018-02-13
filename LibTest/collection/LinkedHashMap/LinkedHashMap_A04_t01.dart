/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashMap({bool equals(K key1, K key2), int hashCode(K key),
 * bool isValidKey(potentialKey)})
 * ...
 * If using methods like operator [], [remove] and [containsKey] together with a
 * custom equality and hashcode, an extra [isValidKey] function can be supplied.
 * This function is called before calling [equals] or [hashCode] with an
 * argument that may not be a [K] instance, and if the call returns [false], the
 * key is assumed to not be in the set. The [isValidKey] function defaults to
 * just testing if the object is a [K] instance.
 * @description Checks that if methods operator[], [remove] and [containsKey]
 * together with a custom equality and hashcode are used and an extra
 * [isValidKey] function is supplied then this function is called before calling
 * [equals] or [hashCode]
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

bool checkDone = false;
bool isValidKeyCalled = false;

bool myEquals(var key1, var key2) {
  if (!checkDone) {
    Expect.isTrue(isValidKeyCalled);
    checkDone = true;
  }
  return key1 == key2;
}

int myHashCode(var key) {
  if (!checkDone) {
    Expect.isTrue(isValidKeyCalled);
    checkDone = true;
  }
  return key.hashCode;
}

bool isValidKey(var potentialKey) {
  isValidKeyCalled = true;
  return potentialKey is int;
}

reset() {
  checkDone = false;
  isValidKeyCalled = false;
}
skip() {
  isValidKeyCalled = true;
}

main() {
  LinkedHashMap map = new LinkedHashMap(equals: myEquals, hashCode: myHashCode,
      isValidKey: isValidKey);
  skip();
  map[1] = 11;
  reset();
  map[1];
  reset();
  map.remove(1);
  reset();
  map.containsKey(1);
  skip();
  map[1] = 2;
  reset();
  map.containsKey(1);
}
