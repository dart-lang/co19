/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashMap<K, V> abstract class 
 * Implements HashMap<K, V>
 * @description Checks that all members of [HashMap] are implemented.
 * @author kaigorodov
 */
import "dart:collection";
import "../../core/Map/compKeysTests.lib.dart" as compKeysTests;
import "../../core/Map/nonCompKeysTests.lib.dart" as nonCompKeysTests;

Map create([Map content]) {
  if (content==null) {
    return new LinkedHashMap();
  } else {
    return new LinkedHashMap.from(content);
  }
}  

main() {
  compKeysTests.test(create);  
  nonCompKeysTests.test(create);  
}