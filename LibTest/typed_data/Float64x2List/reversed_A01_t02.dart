/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> reversed
 * Returns an Iterable of the objects in this list in reverse order.
 * @description Checks that reversed is read-only and cannot be set.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic obj = new Float64x2List(0);
  try {
    obj.reversed = obj.reversed;
    Expect.fail("[reversed] should be read-only");
  } on NoSuchMethodError {}
}
