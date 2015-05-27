/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<K, V> abstract class
 * An unordered collection of key-value pairs, from which you retrieve a value
 * by using its associated key.
 * Each key must be unique. Null values are supported, but null keys are not.
 * @description Checks that map can operate with big amount of pairs.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Map<int, Object> map = new Map<int, Object>();
  
  for(int i = 0; i < 10; i++) {
    for(int j = 0; j < 1000; j++) {
      map[j] = j;
      Expect.isTrue(map.containsKey(j));
      Expect.isTrue(map.containsValue(j));
    }
    
    for(int j = 0; j < 1000; j++) {
      map.remove(j);
      Expect.isTrue(!map.containsKey(j));
      Expect.isTrue(!map.containsValue(j));
    }
  }
}
