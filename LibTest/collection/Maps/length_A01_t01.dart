/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The number of {key, value} pairs in the map.
 * @description Checks that in length stored correct size of the map.
 * @author msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";
import "dart:collection";
 

main() {
  Map<String, Object> map = new Map<String, Object>();
  
  Expect.isTrue(Maps.length(map) == 0);
  
  map["1"] = 1;
  
  Expect.isTrue(Maps.length(map) == 1);
  
  map["2"] = 1;
  Expect.isTrue(Maps.length(map) == 2);
  
  map["2"] = 2;
  Expect.isTrue(Maps.length(map) == 2);

  map.clear();
  Expect.isTrue(Maps.length(map) == 0);
}
