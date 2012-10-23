/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If [key] is not associated to a value, calls [ifAbsent] and
 * updates the map by mapping [key] the value returned by
 * [ifAbsent]. Returns the value in the map.
 * @description Tries to pass incorrect [key].
 * @dynamic-type-error
 * @author msyabro
 * @reviewer varlax
 * @needsreview this is rather compiler check
 * issue 3223
 */

import "../../../Utils/dynamic_check.dart";

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
  checkTypeError( () {
    map.putIfAbsent(key, putIfAbsent);
  });
}
