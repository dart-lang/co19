/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the value for the given [key] or null if [key] is not in the map.
 * @description Checks that the method returns the value to which the specified key is
 * mapped, or null if this map contains no mapping for the key.
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Map<int, Object> intMap = new Map<int, Object>();
  
  Expect.isTrue(intMap[1] == null);
  intMap[1] = 1;
  Expect.isTrue(intMap[1] == 1);
  
  Expect.isTrue(intMap[2] == null);
  intMap[2] = 2;
  Expect.isTrue(intMap[2] == 2);
  
  intMap.remove(1);
  Expect.isTrue(intMap[1] == null);
  
  Map<String, Object> stringMap = new Map<String, Object>();
  String s = "string";
  stringMap[s] = "string";
  Expect.isTrue(stringMap["string"] == "string");
}
