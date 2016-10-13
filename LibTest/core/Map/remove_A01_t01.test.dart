/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract V remove(Object key)
 * Removes the association for the given key.
 * Returns the value for key in the map or null if key is not in the map.
 * @description Checks that the specified key is removed and mapped value is
 * returned (if any).
 * @author msyabro
 */
library remove_A01_t01;

import "../../../Utils/expect.dart";
 
test(Map create([Map content])) {
  Map map = create();
  
  Expect.isTrue(map.remove("1") == null);
  
  map["1"] = 1;
  Expect.isTrue(map.remove("2") == null);
  Expect.isTrue(map.remove("1") == 1);
  Expect.isTrue(!map.containsKey("1"));
  Expect.isTrue(!map.containsValue(1));
}
