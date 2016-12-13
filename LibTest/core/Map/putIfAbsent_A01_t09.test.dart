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
 * @description Checks that it's possible to pass a static function as
 * the second argument.
 * @author msyabro
 */
library putIfAbsent_A01_t09;

class A {
  static Object f() {
    return new Object();
  }
}

test(Map create([Map content])) {
  Map map = create();
  map.putIfAbsent("1", A.f);
}
