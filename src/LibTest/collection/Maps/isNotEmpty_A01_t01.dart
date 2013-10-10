/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if there is at least one {key, value} pair in the map.
 * @description Check that true is returned only if the map is not empty.
 * @author msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";
import "dart:collection";


main() {
  Map<String, Object> map = new Map<String, Object>();
  
  Expect.isFalse(Maps.isNotEmpty(map));
  
  map["1"] = 1;
  Expect.isTrue(Maps.isNotEmpty(map));
  
  map.remove("1");
  Expect.isFalse(Maps.isNotEmpty(map));
}
