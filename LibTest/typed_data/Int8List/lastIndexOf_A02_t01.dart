/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int lastIndexOf(E element, [int start])
 * Returns -1 if element is not found.
 * @description Checks that -1 is returned, if the element is not present.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Int8List.fromList([-1, 0, 0, -1, 2]);
  Expect.equals(-1, l.lastIndexOf(5, 4));
  Expect.equals(-1, l.lastIndexOf(5, 0));
  Expect.equals(-1, l.lastIndexOf(0, 0));
  Expect.equals(-1, l.lastIndexOf(2, 3));
}
