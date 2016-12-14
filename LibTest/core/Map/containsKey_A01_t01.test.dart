/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this map contains the given [key].
 * @description Check that the method returns true if this map contains a
 * mapping for the specified key.
 * @author msyabro
 */
library containsKey_A01_t01;

import "../../../Utils/expect.dart";

test(Map create([Map content])) {
  Map map = create();
  
  Expect.isTrue(!map.containsKey(""));
  map["1"] = 1;
  Expect.isTrue(map.containsKey("1"));
  Expect.isTrue(!map.containsKey("2"));
}
