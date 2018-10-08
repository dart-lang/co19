/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract V remove(Object key)
 * Removes the association for the given key.
 * Returns the value for key in the map or null if key is not in the map.
 * @description Checks that null key can be removed without error.
 * @author msyabro
 */
library remove_A01_t02;

import "../../../Utils/expect.dart";
 
test(Map create([Map content])) {
  Map map = create();
  
  map[null] = 1;
  Expect.isTrue(map.containsKey(null));
  map.remove(null);
  Expect.isFalse(map.containsKey(null));
}
