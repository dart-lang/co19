/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int indexOf(E element, [int start = 0])
 * Returns the first index of element in the list.
 * Searches the list from index [start] to the end of the list. The first time
 * an object o is encountered so that o == [element], the index of o is
 * returned.
 * @description Checks that if not specified, [startIndex] is 0.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float64List.fromList([-1.0, 0.0, 0.0, -1.0, 2.0]);
  Expect.equals(0, l.indexOf(-1.0));
  Expect.equals(1, l.indexOf(0.0));
  Expect.equals(4, l.indexOf(2.0));
}
