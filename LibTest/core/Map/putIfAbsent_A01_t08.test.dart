/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract V putIfAbsent(K key, V ifAbsent())
 * If [key] is not associated to a value, calls [ifAbsent] and
 * updates the map by mapping [key] to the value returned by [ifAbsent].
 * Returns the value in the map.
 * @description Checks that isAbsent is indeed called before putting the new key 
 * in the map if it's not already associated to a value, resulting in a
 * NoSuchMethodError (Type error in checked mode) or NoSuchMethodError if the
 * argument is null or can't be called like a function (according to general
 * language rules).
 * @author msyabro
 */
library putIfAbsent_A01_t08;

import "../../../Utils/expect.dart";

test(Map create([Map content])) {
  dynamic map = create();

  Expect.throws(() {map.putIfAbsent("1", 1);});
      
  Expect.throws(() {map.putIfAbsent("1", null);});
  Expect.isFalse(map.containsKey("1"));
}
