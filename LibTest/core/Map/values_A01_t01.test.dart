/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Iterable<V> values
 * The values of this.
 * @description Checks that an Iterable with all values is returned.
 * @author msyabro
 */
library values_A01_t01;

import "../../../Utils/expect.dart";
 
test(Map create([Map content])) {
  Map map = create();
    
  Iterable a = map.values;
  Expect.isTrue(a.length == 0);
  
  map["1"] = 1;
  map["2"] = 2;
  
  a = map.values;
  Expect.isTrue(a.length == 2);
  Expect.isTrue(a.contains(1));
  Expect.isTrue(a.contains(2));
  
  map["3"] = 1;
  a = map.values;
  Expect.isTrue(a.length == 3);
  
  map.clear();
  a = map.values;
  Expect.isTrue(a.length == 0);
}
