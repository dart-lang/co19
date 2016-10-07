/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Associates the [key] with the given [value].
 * @description Checks that the specified pair is inserted into the map.
 * @author msyabro
 */
library operator_subscripted_assignment_A01_t01;
 
import "../../../Utils/expect.dart";
 
test(Map create([Map content])) {
  Map map = create();
  map[""] = "";
  Expect.isTrue(map.containsValue(""));
  
  map[""] = "1";
  Expect.isTrue(map.containsKey("") && map.containsValue("1"));
  Expect.isTrue(!map.containsValue(""));
  
  map.remove("");
  map[""] = map;
  Expect.isTrue(map.containsKey("") && map.containsValue(map));

  map[""] = null;
  Expect.isTrue(map.containsValue(null));
  Expect.isTrue(map[""] == null);
}
