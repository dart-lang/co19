/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic putIfAbsent(Map map, key, ifAbsent())
 * If [key] is not associated to a value, calls [ifAbsent] and
 * updates the map by mapping [key] the value returned by [ifAbsent].
 * Returns the value in the map.
 * @description Checks that isAbsent is indeed called before putting the new key 
 * in the map if it's not already associated to a value, resulting in a
 * NoSuchMethodError if the argument is null or can't
 * be called like a function (according to general language rules).
 * @author msyabro
 * @reviewer varlax
 * @needsreview undocumented
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Map<String, Object> map = new Map<String, Object>();
      
  Expect.throws(() {
    Maps.putIfAbsent(map, "1", null);
  });
  
  Expect.isFalse(Maps.containsKey(map, "1"));
}
