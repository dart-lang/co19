/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion @assertion LinkedHashMap<K, V> abstract class
 * implements HashMap<K, V>
 * The map allows [null] as a key.
 * @description Checks that [null] key works as expected.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  LinkedHashMap map = new LinkedHashMap();

  map[null] = 1;
  Expect.equals(1, map[null]);

  for (int i = 0; i < 100; i++) {
    map[i] = i;
  }
  Expect.equals(1, map[null]);

  map[null] = "testme";
  Expect.equals("testme", map[null]);

  map.remove(null);
  Expect.equals(null, map[null]);
}
