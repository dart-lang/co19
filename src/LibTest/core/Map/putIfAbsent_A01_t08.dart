/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If [key] is not associated to a value, calls [ifAbsent] and
 * updates the map by mapping [key] the value returned by
 * [ifAbsent]. Returns the value in the map.
 * @description Checks that isAbsent is indeed called before putting the new
 * key in the map if it's not already associated to a value, resulting in a 
 * NoSuchMethodError or NullPointerException if the argument is null or can't 
 * be called like a function (according to general language rules).
 * @static-warning
 * @author msyabro
 * @reviewer varlax
 * @needsreview undocumented
 */


main() {
  Map<String, Object> map = new Map<String, Object>();
      
  try {
    map.putIfAbsent("1", 1);
    Expect.fail("NoSuchMethodError is expected");
  } on NoSuchMethodError catch(e) {}

  try {
    map.putIfAbsent("1", null);
    Expect.fail("NullPointerException is expected");
  } on NullPointerException catch(e) {}
  
  Expect.isFalse(map.containsKey("1"));
}
