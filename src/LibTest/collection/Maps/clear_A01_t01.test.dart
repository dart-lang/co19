/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Removes all pairs from the map.
 * @description Checks that all of the mappings from this map are removed.
 * @author msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Map<String, Object> map = new Map<String, Object>();

  Maps.clear(map); //Check that empty map can be cleared
  Expect.isTrue(Maps.length(map) == 0);
  
  map["1"] = 1;
  map["2"] = 2;
  Expect.isTrue(Maps.length(map) == 2);
  
  Maps.clear(map);
  Expect.isTrue(Maps.length(map) == 0);
  Expect.isTrue(map["1"] == null && map["2"] == null);
}
