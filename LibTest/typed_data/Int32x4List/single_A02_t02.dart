/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E single
 * ...
 * Throws a StateError if this is empty or has more than one element.
 * @description Checks that a StateError is thrown if this has more than one
 * element.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var l = new Int32x4List.fromList([i32x4(10), i32x4(11)]);
  try {
    l.single;
    Expect.fail("StateError is expected");
  } on StateError {}
}
