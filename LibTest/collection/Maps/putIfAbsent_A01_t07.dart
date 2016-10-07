/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic putIfAbsent(Map map, key, ifAbsent())
 * If [key] is not associated to a value, calls [ifAbsent] and
 * updates the map by mapping [key] the value returned by [ifAbsent].
 * Returns the value in the map.
 * @description Checks that if [key] is already associated to a value, [ifAbsent]
 * is not called and its incorrect value is not detected.
 * @author msyabro
 * @needsreview undocumented
 * @reviewer varlax
 */
import "../../../Utils/dynamic_check.dart";
import "dart:collection";

main() {
  Map<String, Object> map = new Map<String, Object>();
  map["1"] = 1;

  dynamic i1 = "1";
  dynamic i2 = 1;
  checkTypeError(() {
    Maps.putIfAbsent(map, i1, i2);
  });
}
