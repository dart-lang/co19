/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Removes all pairs from the map.
 * @description Checks that all of the mappings from this map are removed.
 * @author msyabro
 */
library clear_A01_t01;

import "../../../Utils/expect.dart";

test(Map create([Map content])) {
  Map map = create();

  map.clear(); //Check that empty map can be cleared
  Expect.isTrue(map.length == 0);
  
  map["1"] = 1;
  map["2"] = 2;
  Expect.isTrue(map.length == 2);
  
  map.clear();
  Expect.isTrue(map.length == 0);
  Expect.isTrue(map["1"] == null && map["2"] == null);
}
