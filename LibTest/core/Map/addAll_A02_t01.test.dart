/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void addAll(Map<K, V> other)
 * If a key of other is already in this map, its value is overwritten.
 * @description Checks that if a key of other is already in this map, its value
 * is overwritten.
 * @author kaigorodov
 */
library addAll_A02_t01;

import "../../../Utils/expect.dart";

test(Map create([Map content])) {
  Map map = create();
  Map other1 = {1: 0, "2": 2, 3.0: null};
  Map other2 = {1: 0.1, "2": "2", 3.0: 3.14};
  
  map.addAll(other1);
  map.forEach ((var key, var value) {
    Expect.identical(other1[key], value);
  });
  other1.forEach ((var key, var value) {
    Expect.identical(map[key], value);
  });

  map.addAll(other2);
  map.forEach ((var key, var value) {
    Expect.identical(other2[key], value);
  });
  other2.forEach ((var key, var value) {
    Expect.identical(map[key], value);
  });
}
