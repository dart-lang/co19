/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<int, E> asMap()
 * Returns an unmodifiable [Map] view of this.
 * The map uses the indices of this list as keys and the corresponding objects
 * as values.
 * @description Checks that the returned map is unmodifiable.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  var l = new Uint8List.fromList(list);
  var m = l.asMap();

  Expect.throws(() {
    m[0] = 0;
  });
}

main() {
  check([]);
  check([1]);
  check([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]);
}
