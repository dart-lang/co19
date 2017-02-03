/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isEmpty(Map map)
 * @description Check that [true] is returned only if the [map] is empty.
 * @author msyabro
 */
import "../../../Utils/expect.dart";
import "dart:collection";


main() {
  Map<String, Object> map = new Map<String, Object>();
  
  Expect.isTrue(Maps.isEmpty(map));
  
  map["1"] = 1;
  Expect.isTrue(!Maps.isEmpty(map));
  
  map.remove("1");
  Expect.isTrue(Maps.isEmpty(map));
}
