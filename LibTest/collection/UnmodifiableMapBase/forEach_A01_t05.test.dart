/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void action(K key, V value))
 * Applies [f] to each key-value pair of the map.
 * @description Checks nested [forEach].
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "unmodifiablemapbase.lib.dart";

main() {
  UnmodifiableMapBase base = new UnmodifiableMapBaseImpl({1 : 3, "2" : 5});

  int count = 0;
  base.forEach((var key1, Object value1) {
    base.forEach((var key2, Object value2) {
      base.forEach((var key3, Object value3) {
        count++;
      });
    });
  });
  Expect.isTrue(count == 8);
}
