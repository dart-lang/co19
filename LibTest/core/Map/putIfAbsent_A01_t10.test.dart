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
 * @description Checks that anything thrown by the argument function
 * breaks operation and is passed through to the caller.
 * @author varlax
 */
library putIfAbsent_A01_t10;

import "../../../Utils/expect.dart";

test(Map create([Map content])) {
  Map map = create();

  Object f() {
    throw "Exception!";
  }
  
  Expect.throws(() {
    map.putIfAbsent("1", f);
  });

  Expect.isTrue(map.isEmpty);
}
