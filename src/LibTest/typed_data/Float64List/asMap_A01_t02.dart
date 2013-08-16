/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<int, E> asMap()
 * Returns an unmodifiable [Map] view of this.
 * It has the indices of this list as keys, and the corresponding elements
 * as values.
 * @description Checks that the returned map is unmodifiable.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

check(list) {
  var l = new Float64List.fromList(list);
  var m = l.asMap();
  try {
    m[0] = 0;
    Expect.fail("Map is modifiable");
  } catch(ok) {}
}

main() {
  check([]);
  check([1.0]);
  check([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0]);
}
