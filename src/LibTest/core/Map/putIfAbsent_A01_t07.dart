/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If [key] is not associated to a value, calls [ifAbsent] and
 * updates the map by mapping [key] the value returned by
 * [ifAbsent]. Returns the value in the map.
 * @description Tries to pass incorrect value as ifAbsent argument if [key] 
 * is already in the map and checks that no attempt to call that value is made.
 * @static-warning
 * @author msyabro
 * @needsreview undocumented
 * @reviewer varlax
 */


main() {
  Map<String, Object> map = new Map<String, Object>();
  map["1"] = 1;
  
  map.putIfAbsent("1", null);
  map.putIfAbsent("1", 1);
}
