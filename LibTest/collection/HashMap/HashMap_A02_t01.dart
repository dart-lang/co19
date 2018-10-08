/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HashMap({bool equals(K key1, K key2), int hashCode(K key),
 * bool isValidKey(potentialKey) })
 * The created map is not ordered in any way. When iterating the keys or values,
 * the iteration order is unspecified except that it will stay the same as long
 * as the map isn't changed.
 * @description Checks that iteration order does not change if map is not
 * changed.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "dart:math";

main() {
  HashMap map = new HashMap();
  Random ran = new Random();
  for (int i = 0; i < 100; i++) {
    double num = ran.nextDouble();
    map.putIfAbsent(num, () => num);
  }

  List result = new List();

  map.forEach((key, value) {
    result.add(value);
  });

  int i = 0;
  map.forEach((key, value) {
    Expect.equals(value, result[i++]);
  });

  i = 0;
  map.forEach((key, value) {
    Expect.equals(value, result[i++]);
  });
}
