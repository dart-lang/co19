/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void forEach(void f(K key, V value))
 * Applies f to each {key, value} pair of the map.
 * @description Nested forEach.
 * @author msyabro
 */
library forEach_A01_t08;

import "../../../Utils/expect.dart";

test(Map create([Map content])) {
  Map map = create();
  
  map["1"] = 3;
  map["2"] = 5;
  
  int count = 0;
  map.forEach((var key1, var value1) {
    map.forEach((var key2, var value2) {
      map.forEach((var key3, var value3) {count++;});
    });
  });
  Expect.isTrue(count == 8);
}
