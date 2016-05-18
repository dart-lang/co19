/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashMap<K, V> abstract class 
 * Implements HashMap<K, V>
 * @description Checks that LinkedHashMap implements HashMap.
 * @author kaigorodov
 */
import "dart:collection";
import "../HashMap/allTests.lib.dart";

Map create([Map content]) {
  if (content == null) {
    return new LinkedHashMap();
  } else {
    return new LinkedHashMap.from(content);
  }
}  

main() {
  test(create);  
}
