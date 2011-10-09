/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this map contains the given [value].
 * @description checks that the method returns true if this map contains a mapping
 * for the specified key.
 * @author msyabro
 * @reviewer varlax
 */
 

main() {
  Map<String, Object> stringObjectMap = new Map<String, Object>();
  Expect.isTrue(!stringObjectMap.containsValue(null));
  
  stringObjectMap["1"] = 1;
  Expect.isTrue(stringObjectMap.containsValue(1));
  
  stringObjectMap["2"] = null;
  Expect.isTrue(stringObjectMap.containsValue(null));
  
  stringObjectMap["3"] = 1;
  Expect.isTrue(stringObjectMap.containsValue(1));
  
  stringObjectMap["4"] = stringObjectMap;
  Expect.isTrue(stringObjectMap.containsValue(stringObjectMap));
  
  stringObjectMap["4"] = 4;
  Expect.isTrue(!stringObjectMap.containsValue(stringObjectMap));    
}
