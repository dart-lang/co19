/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interface HashSet<E>
 * HashSet({bool equals(E e1, E e2), int hashCode(E e),
 * bool isValidKey(potentialKey) })
 * If [isValidKey] is omitted, it defaults to testing if the object is an [E]
 * instance.
 * @description Checks that default [isValidKey] function checks if the object
 * is a [K] instance. This means that equals and hashCode functions will not be
 * called for instances of unsupported types.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:collection";

int i = 0;
bool equals(dynamic key1, dynamic key2) {
  i++;
  return key1 == key2;
}

int hashCode(dynamic key) {
  i++;
  return key;
}

main() {
  HashSet<int> set = new HashSet<int>(equals : equals, hashCode : hashCode);
  set.addAll([0, 1, 2, -3, -4]);

  i = 0;
  bool j = set.contains(null);
  Expect.equals(0, i);
  j = set.contains("string");
  Expect.equals(0, i);
  set.remove([]);
  Expect.equals(0, i);
}
