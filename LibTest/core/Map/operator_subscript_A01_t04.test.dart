/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the value for the given [key] or null if [key] is not in
 * the map.
 * @description Checks that null keys and values are supported.
 * @author kaigorodov
 */
library operator_subscript_A01_t04;
 
import "../../../Utils/expect.dart";
 
test(Map create([Map content])) {
  Map map = create();
  Expect.equals(null, map[null]);
  Expect.isFalse(map.containsKey(null));  
  map[null] = null;
  Expect.equals(null, map[null]);
  Expect.isTrue(map.containsKey(null));  
}
