/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isNotEmpty
 * Returns true if there is at least one {key, value} pair in the map.
 * @description Check that true is returned only if the map is not empty.
 * @author msyabro
 */
library isNotEmpty_A01_t01;

import "../../../Utils/expect.dart";

test(Map create([Map content])) {
  Map map = create();
  
  Expect.isFalse(map.isNotEmpty);
  
  map["1"] = 1;
  Expect.isTrue(map.isNotEmpty);
  
  map.remove("1");
  Expect.isFalse(map.isNotEmpty);
}
