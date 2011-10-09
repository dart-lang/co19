/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If [key] is not associated to a value, calls [ifAbsent] and
 * updates the map by mapping [key] the value returned by
 * [ifAbsent]. Returns the value in the map.
 * @description Try to pass argument function with incorrect return type.
 * @static-type-error
 * @author msyabro
 * @reviewer varlax
 * @needsreview: this is rather compiler check 
 */


main() {
  int putIfAbsent() { return 1;}
  Map<String, bool> map = new Map<String, bool>();
  
  map.putIfAbsent("1", putIfAbsent);
  
  Expect.isTrue(map.containsKey("1"));
}
