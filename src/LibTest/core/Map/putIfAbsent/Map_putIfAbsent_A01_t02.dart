/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If [key] is not associated to a value, calls [ifAbsent] and
 * updates the map by mapping [key] the value returned by
 * [ifAbsent]. Returns the value in the map.
 * @description Tries to modify map in the function.
 * @author varlax
 */


main() {
  int i = 1;
  Map<String, Object> map = new Map<String, Object>();
  Object putIfAbsent() {
    map["1"] = 10;
    return i;
  }
  
  Expect.isTrue(map.putIfAbsent("1", putIfAbsent) == 1);
  Expect.isTrue(map["1"] == 1);
  
  /*i = 2;
  
  Expect.isTrue( map.putIfAbsent("1", putIfAbsent) == 1);
  Expect.isTrue(map["1"] == 10);*/
}
