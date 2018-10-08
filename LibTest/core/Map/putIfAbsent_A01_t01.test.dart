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
 * @description Checks that the new mapping added only if the key is not present
 * in the map. Checks the returned value.
 * @author msyabro
 */
library putIfAbsent_A01_t01;

import "../../../Utils/expect.dart";

test(Map create([Map content])) {
  Map map = create();
  int i = 1;
  
  Object putIfAbsent() {
    return i;
  }
  
  Expect.isTrue(map.putIfAbsent("1", putIfAbsent) == 1);
  Expect.isTrue(map["1"] == 1);
  
  i = 2;
  
  Expect.isTrue( map.putIfAbsent("1", putIfAbsent) == 1);
  Expect.isTrue(map["1"] == 1);
}
