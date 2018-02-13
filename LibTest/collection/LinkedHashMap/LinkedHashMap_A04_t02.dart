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
 * @description Checks that if [isValidKey] returns [false] then the key is
 * assumed to not be in the set
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

bool myEquals(var key1, var key2) {
  return key1 == key2;
}

int myHashCode(var key) {
  return key.hashCode;
}

bool isValidKey(var potentialKey) {
  return (potentialKey is int) && potentialKey < 100;
}

main() {
  LinkedHashMap map = new LinkedHashMap(equals: myEquals, hashCode: myHashCode,
      isValidKey: isValidKey);

  map[1] = 11;
  Expect.equals(11, map[1]);
  Expect.isTrue(map.containsKey(1));
  Expect.equals(11, map.remove(1));
  Expect.isFalse(map.containsKey(1));

  map[101] = 11;
  Expect.isNull(map[101]);
  Expect.isFalse(map.containsKey(101));
  Expect.isNull(map.remove(101));
}
