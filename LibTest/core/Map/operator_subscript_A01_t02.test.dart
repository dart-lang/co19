/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the value for the given [key] or null if [key] is not in
 * the map.
 * @description Checks that null key is allowed
 * @author kaigorodov
 */
library operator_subscript_A01_t02;
 
import "../../../Utils/expect.dart";
 
test(Map create([Map content])) {
  Map map = create();
  Object value = "value";
  Expect.isFalse(map.containsKey(null));  
  Expect.equals(null, map[null]);
  map[null] = value;
  Expect.isTrue(map.containsKey(null));  
  Expect.equals(value, map[null]);
}
