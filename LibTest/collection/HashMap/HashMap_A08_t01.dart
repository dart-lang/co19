/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HashMap({bool equals(K key1, K key2), int hashCode(K key),
 * bool isValidKey(potentialKey) })
 * Likewise, if [equals] is [identical], [hashCode] is [identityHashCode] and
 * [isValidKey] is omitted, the resulting map is identity based, and the
 * [isValidKey] defaults to accepting all keys. Such a map can be created
 * directly using [HashMap.identity].
 * @description Checks that default [isValidKey] function accepts all the keys
 * if [equals] and [hashCode] functions are not provided for [HashMap.identity].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  main() {
    String aString = "string";
    Object anObject = new Object();
    Error anError = new Error();
    Map aMap = {0 : 1};
    List aList = [1, 2, 3];

    Map map = {0 : 0, null : "null", aString : null, anObject : -3,
        anError : "error", aMap : 6, aList : 1};

    List notIdentical = [2, -5, "null", "str" + "ing", "string", new Object(),
        new Error(), {0 : 1}, {}, [], [1, 2, 3]];

    HashMap hashmap = new HashMap.identity();
    hashmap.addAll(map);
    map.forEach((key, value) {
      Expect.isTrue(hashmap.containsKey(key));
      Expect.equals(value, hashmap[key]);
    });

    notIdentical.forEach((element) =>
        Expect.isFalse(hashmap.containsKey(element)));
  }

}
