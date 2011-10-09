/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A [Map] is an associative container, mapping a key to a value.
 * Null values are supported.
 * @description Check that map can operate with big amount of pairs
 * @author msyabro
 */


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
