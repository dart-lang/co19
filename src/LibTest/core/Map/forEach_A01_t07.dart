/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies [f] to each {key, value} pair of the map.
 * @description Tries to remove or add pairs in [f].
 * @author msyabro
 * @needsreview undocumented
 */


main() {
  Map<String, Object> map = new Map<String, Object>();
  
  map["1"] = 3;
  map["2"] = 5;
  
  map.forEach(void func(String key, Object value) {
    map["3"] = key;
  });
  Expect.isTrue(map.containsKey("3"));
  Expect.equals(3, map.length);
  
  int i = 0;
  map.forEach(void func(String key, Object value) {
    map.remove("2");
    i++;
  });
  Expect.isTrue(i == 2);
  
  map.forEach(void func(String key, Object value) {
    map.remove(key);
  });
  Expect.isTrue(map.isEmpty());
  
  map["1"] = 1;
  map["2"] = 2;
  i = 0;
  map.forEach(void func(String key, Object value) {
    map.clear();
    i++;
  });
  Expect.isTrue(i == 1 && map.isEmpty());
}
