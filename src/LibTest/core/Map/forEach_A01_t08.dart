/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies [f] to each {key, value} pair of the map.
 * @description Nested forEach.
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Map<String, Object> map = new Map<String, Object>();
  
  map["1"] = 3;
  map["2"] = 5;
  
  int count = 0;
  map.forEach(void func1stLvl(String key1, Object value1) {
    map.forEach(void func2ndLvl(String key2, Object value2) {
      map.forEach(void func3rdLvl(String key3, Object value3) {count++;});
    });
  });
  Expect.isTrue(count == 8);
}
