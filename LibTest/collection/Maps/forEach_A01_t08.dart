/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies [f] to each {key, value} pair of the map.
 * @description Nested forEach.
 * @author msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";
import "dart:collection";


main() {
  Map<String, Object> map = new Map<String, Object>();
  
  map["1"] = 3;
  map["2"] = 5;
  
  int count = 0;
  Maps.forEach(map, (String key1, Object value1) {
    Maps.forEach(map, (String key2, Object value2) {
      Maps.forEach(map, (String key3, Object value3) {count++;});
    });
  });
  Expect.isTrue(count == 8);
}
