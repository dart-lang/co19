/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable getValues(Map map)
 * @description Checks that an [Iterable] with all values is returned.
 * @author msyabro
 */
import "../../../Utils/expect.dart";
import "dart:collection";
 

main() {
  Map<String, Object> map = new Map<String, Object>();
  
  Iterable a = Maps.getValues(map);
  Expect.isTrue(a.length == 0);
  
  map["1"] = 1;
  map["2"] = 2;
  
  a = Maps.getValues(map);
  Expect.isTrue(a.length == 2);
  Expect.isTrue(a.contains(1));
  Expect.isTrue(a.contains(2));
  
  map["3"] = 1;
  a = Maps.getValues(map);
  Expect.isTrue(a.length == 3);
  
  Maps.clear(map);
  a = Maps.getValues(map);
  Expect.isTrue(a.length == 0);
}
