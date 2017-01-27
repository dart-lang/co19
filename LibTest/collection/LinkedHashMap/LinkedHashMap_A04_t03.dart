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
 * @description Checks that [isValidKey] is not ignored if [equals] and
 * [hashCode] are not specified
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

bool called = false;

bool isValidKey(var potentialKey) {
  called = true;
  return (potentialKey is int) && potentialKey < 100;
}

main() {
  LinkedHashMap map = new LinkedHashMap(isValidKey: isValidKey);

  map[101] = 1.1;

  Expect.isNull(map[101]);
  Expect.isTrue(called);

  called = false;
  Expect.isFalse(map.containsKey(101));
  Expect.isTrue(called);

  called = false;
  Expect.isNull(map.remove(101));
  Expect.isTrue(called);
}
