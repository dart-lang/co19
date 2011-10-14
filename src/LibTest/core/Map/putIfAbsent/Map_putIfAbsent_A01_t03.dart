/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If [key] is not associated to a value, calls [ifAbsent] and
 * updates the map by mapping [key] the value returned by
 * [ifAbsent]. Returns the value in the map.
 * @description Tries to pass function that returns nothing (has void return type)
 * @needsreview There is no analog of this function in Java. And it's not clear
 * what the result should be: pair [[key], null] must be added 
 * or nothing should be added to the map
 * @author msyabro
 * @reviewer varlax
 */


main() {
  void  putIfAbsent() {}
  Map<String, bool> map = new Map<String, bool>();
  
  map.putIfAbsent("1", putIfAbsent);
  
  Expect.isTrue(map.containsKey("1"));
  Expect.isTrue(map["1"] == null);
}
