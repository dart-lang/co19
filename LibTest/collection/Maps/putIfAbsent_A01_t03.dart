/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic putIfAbsent(Map map, key, ifAbsent())
 * If [key] is not associated to a value, calls [ifAbsent] and updates the map
 * by mapping [key] the value returned by [ifAbsent].
 * Returns the value in the map.
 * @description Tries to pass incorrect [key].
 * @author msyabro
 * issue 3223
 */

import "../../../Utils/expect.dart";
import "dart:collection";

class A {
  A() {}
  int get hashCode {
    return 1;
  }
}


main() {
  bool  putIfAbsent() {
    return true;
  }
  Map<String, bool> map = new Map<String, bool>();
  var key = new A();

  Expect.throws(() => Maps.putIfAbsent(map, key, putIfAbsent));
}
