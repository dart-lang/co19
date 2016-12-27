/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HashMap({bool equals(K key1, K key2), int hashCode(K key),
 * bool isValidKey(potentialKey) })
 * If using methods like [operator[]], [remove] and [containsKey] together with
 * a custom equality and hashcode, an extra [isValidKey] function can be
 * supplied.
 * This function is called before calling [equals] or [hashCode] with an
 * argument that may not be a [K] instance, and if the call returns [false], the
 * key is assumed to not be in the set.
 * @description Checks that when performing [], [remove] or [containsKey],
 * [isValidKey] is called before [equals] and [hashCode] functions, and if
 * [isValidKey] return [false], equals and [hashCode] are not called at all.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

String sequence = "";

bool equals(dynamic key1, dynamic key2) {
  sequence = sequence + "e";
  return key1 == key2;
}

int hashCode(dynamic key) {
  sequence = sequence + "h";
  return key;
}

bool isValidKey(Object key) {
  sequence = sequence + "i";
  return key is int && key > 0;
}

main() {
  HashMap map = new HashMap(
      equals: equals, hashCode: hashCode, isValidKey : isValidKey);
  map.addAll({1 : 1, 3: 3, 9 : 9});

  sequence = "";
  Expect.isFalse(map.containsKey(-3));
  Expect.equals(null, map[-7]);
  map.remove(-15);
  Expect.isTrue(sequence.contains("i"));
  Expect.isFalse(sequence.contains("e"));
  Expect.isFalse(sequence.contains("h"));

  sequence = "";
  Expect.isTrue(map.containsKey(3));
  Expect.isTrue(sequence.startsWith("i"));

  sequence = "";
  Expect.equals(3, map[3]);
  Expect.isTrue(sequence.startsWith("i"));

  sequence = "";
  map.remove(9);
  Expect.isTrue(sequence.startsWith("i"));
}
