/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int length(Map map)
 * @description Checks that in [length] stored correct size of the [map].
 * @author msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";
import "dart:collection";
 

main() {
  Map<String, Object> map = new Map<String, Object>();
  
  Expect.equals(0, Maps.length(map));
  
  map["1"] = 1;
  
  Expect.equals(1, Maps.length(map));
  
  map["2"] = 1;
  Expect.equals(2, Maps.length(map));
  
  map["2"] = 2;
  Expect.equals(2, Maps.length(map));

  map.clear();
  Expect.equals(0, Maps.length(map));
}
