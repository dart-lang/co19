/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashMap({bool equals(K key1, K key2), int hashCode(K key),
 * bool isValidKey(potentialKey)})
 * If the [equals] or [hashCode] methods won't work on all objects, but only on
 * some instances of [E], the [isValidKey] predicate can be used to restrict the
 * keys that the functions are applied to. Any key for which [isValidKey]
 * returns false is automatically assumed to not be in the set when asking
 * [contains].
 * @description Checks that if [isValidKey] returns [false] then value is
 * assumed to not be in the set when asking [contains]
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

bool myEquals(var key1, var key2) => key1 == key2;

int myHashCode(var key) => key.hashCode;

bool isValidKey(var potentialKey) {
  return (potentialKey is int) && potentialKey < 100;
}

main() {
  LinkedHashSet set = new LinkedHashSet(equals: myEquals, hashCode: myHashCode,
      isValidKey: isValidKey);

  set.add(1);
  Expect.isTrue(set.contains(1));

  set.add(101);
  Expect.isFalse(set.contains(101));

}
