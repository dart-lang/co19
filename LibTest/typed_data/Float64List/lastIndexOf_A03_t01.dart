/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int lastIndexOf(E element, [int start])
 * @description Checks that if [start] is out of bounds, it doesn't cause
 * any errors.
 * @note undocumented
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float64List.fromList([-1.0, 0.0, 0.0, -1.0, 2.0]);
  Expect.equals(-1, l.lastIndexOf(-1.0, -1));
  Expect.equals(-1, l.lastIndexOf(0.0, -100000));
  Expect.equals(4, l.lastIndexOf(2.0, 1000));
}
