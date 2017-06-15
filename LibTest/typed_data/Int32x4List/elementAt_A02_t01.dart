/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E elementAt(int index)
 * ...
 * The index must be non-negative and less than length.
 * @description Checks that the index must be non-negative and less than length.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(int length) {
  var l = new Int32x4List(length);
  Expect.throws(() {
    l.elementAt(-1);
  });
  Expect.throws(() {
    l.elementAt(length);
  });
}

main() {
  check(0);
  check(20);
  check(100);
  check(3000);
}
