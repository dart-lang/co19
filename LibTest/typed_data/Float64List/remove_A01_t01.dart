/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool remove(Object value)
 * Removes the first occurrence of value from this list.
 * ...
 * An UnsupportedError occurs if the list is fixed-length.
 * @description Checks that [UnsupportedError] is thrown since [Float64List] is
 * a fixed-length list.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<double> list, double element) {
  var l = new Float64List.fromList(list);
  var length = l.length;
  try {
    l.remove(element);
    Expect.fail("This operation should not be supported");
  } on UnsupportedError {};
  Expect.equals(length, l.length);
}

main() {
  check([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0], 1.0);
  check([0.0], 0.0);

  check([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0], 0.0);
  check([], 1.0);
}
