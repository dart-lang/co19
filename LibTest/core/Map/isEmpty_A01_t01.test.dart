/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isEmpty
 * Returns true if there is no {key, value} pair in the map.
 * @description Check that true is returned only if the map is empty.
 * @author msyabro
 */
library isEmpty_A01_t01;

import "../../../Utils/expect.dart";

test(Map create([Map content])) {
  Map map = create();
  
  Expect.isTrue(map.isEmpty);
  
  map["1"] = 1;
  Expect.isFalse(map.isEmpty);
  
  map.remove("1");
  Expect.isTrue(map.isEmpty);
}
