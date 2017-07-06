/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E first
 * Returns the first element.
 * Throws a StateError if this is empty. Otherwise returns the first element
 * in the iteration order, equivalent to this.elementAt(0).
 * @description Checks that the getter returns the first element in the
 * iteration order, equivalent to this.elementAt(0).
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<double> array) {
  var l = new Float32List.fromList(array);
  Expect.equals((l.iterator..moveNext()).current, l.first);
  Expect.equals(l.elementAt(0), l.first);
}

void checkClear(int length) {
  var l = new Float32List(length);
  Expect.equals((l.iterator..moveNext()).current, l.first);
  Expect.equals(l.elementAt(0), l.first);
}

main() {
  check([1.0]);
  check([1.0, 2.0, 3.0, 4.0, 5.0]);
  check([
    1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
  ]);
  checkClear(1);
  checkClear(100);
}
