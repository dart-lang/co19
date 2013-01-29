/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If [key] is not associated to a value, calls [ifAbsent] and
 * updates the map by mapping [key] the value returned by
 * [ifAbsent]. Returns the value in the map.
 * @description Checks that isAbsent is indeed called before putting the new key 
 * in the map if it's not already associated to a value, resulting in a NoSuchMethodError 
 * (Type error in checked mode) or NoSuchMethodError if the argument is null or can't 
 * be called like a function (according to general language rules).
 * @static-warning
 * @author msyabro
 * @reviewer varlax
 * @needsreview undocumented
 */
import "../../../Utils/dynamic_check.dart";

main() {
  Map<String, Object> map = new Map<String, Object>();
      
  try {
    map.putIfAbsent("1", 1); /// static type warning
    Expect.fail("NoSuchMethodError is expected");
  } catch(e) {
    if(isCheckedMode()) {
      Expect.isTrue(e is TypeError, "Type error expected in checked mode");
    } else {
      Expect.isTrue(e is NoSuchMethodError, "NoSuchMethodError expected in checked mode");
    }
  }

  try {
    map.putIfAbsent("1", null);
    Expect.fail("NoSuchMethodError is expected");
  } on NoSuchMethodError catch(e) {}
  
  Expect.isFalse(map.containsKey("1"));
}
