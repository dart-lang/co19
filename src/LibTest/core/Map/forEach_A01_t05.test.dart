/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void forEach(void f(K key, V value))
 * Applies f to each {key, value} pair of the map.
 * @description Tries to pass function that returns something.
 * @author msyabro
 * @reviewer varlax
 */
library forEach_A01_t05;

test(Map create([Map content])) {
  Map<String, Object> map = create();
  
  map["1"] = 3;
  map["2"] = 5;
  
  int f(String x, Object y) {
    return 1;
  }
  
  map.forEach(f);
}
