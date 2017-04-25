/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int indexOf(Object element, [int startIndex = 0])
 * Returns -1 if element is not found.
 * @description Checks that value -1 is returned, if the element
 * is not present.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float32List.fromList([-1.0, 0.0, 0.0, -1.0, 2.0]);
  Expect.equals(-1, l.indexOf(5.0));
  Expect.equals(-1, l.indexOf(5.0, 0));
  Expect.equals(-1, l.indexOf(5.0, 4));
  Expect.equals(-1, l.indexOf(0.0, 3));
  Expect.equals(-1, l.indexOf(-1.0, 4));
}
