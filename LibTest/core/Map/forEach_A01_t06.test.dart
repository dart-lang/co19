/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void forEach(void f(K key, V value))
 * Applies f to each {key, value} pair of the map.
 * @description Checks that keys and values can be changed in [f].
 * @author msyabro
 */
library forEach_A01_t06;

import "../../../Utils/expect.dart";

test(Map create([Map content])) {
  Map map = create();
  
  map["1"] = 3;
  map["2"] = 5;
  
  map.forEach((var key, var value) {
    map[key] = value + 1;
  });
  
  Expect.isTrue(map["1"] == 4 && map["2"] == 6);
}
