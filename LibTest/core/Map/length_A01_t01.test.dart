/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int length
 * The number of {key, value} pairs in the map.
 * @description Checks that in length stored correct size of the map.
 * @author msyabro
 */
library length_A01_t01;
 
import "../../../Utils/expect.dart";
 
test(Map create([Map content])) {
  Map map = create();
  Expect.isTrue(map.length == 0);
  
  map["1"] = 1;
  
  Expect.isTrue(map.length == 1);
  
  map["2"] = 1;
  Expect.isTrue(map.length == 2);
  
  map["2"] = 2;
  Expect.isTrue(map.length == 2);

  map.clear();
  Expect.isTrue(map.length == 0);
}
