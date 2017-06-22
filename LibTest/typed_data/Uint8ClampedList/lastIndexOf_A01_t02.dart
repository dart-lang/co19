/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int lastIndexOf(E element, [int start])
 * ...
 * If start is not provided, this method searches from the end of the list.
 * @description Checks that if not specified, [start] is set to the end of
 * this list.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Uint8ClampedList.fromList([1, 0, 0, 1, 2]);
  Expect.equals(3, l.lastIndexOf(1));
  Expect.equals(2, l.lastIndexOf(0));
  Expect.equals(4, l.lastIndexOf(2));
}
