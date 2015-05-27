/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Returns a string representation of this object.
 * @description Checks that a [String] is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(count) {
  var l = new ByteData(count);
  var res = l.toString();
  Expect.isTrue(res is String);
}

main() {
  check(0);
  check(1);
  check(5);
  check(100);
}
