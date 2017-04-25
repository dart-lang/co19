/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int lastIndexOf(Object element, [int startIndex])
 * Returns the last index of element in this list.
 * Searches the list backwards from index start to 0.
 * The first time an object o is encountered so that o == element, the index of
 * o is returned.
 * If start is not provided, this method searches from the end of the list.
 * @description Checks that if not specified, this method searches from the end
 * of the list.
 * @note undocumented
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float32List.fromList([-1.0, 0.0, 0.0, -1.0, 2.0]);
  Expect.equals(3, l.lastIndexOf(-1.0));
  Expect.equals(2, l.lastIndexOf(0.0));
  Expect.equals(4, l.lastIndexOf(2.0));
}
