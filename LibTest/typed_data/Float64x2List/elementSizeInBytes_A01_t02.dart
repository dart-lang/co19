/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int elementSizeInBytes
 * Returns the number of bytes in the representation of each element in this
 * list.
 * @description Checks that [elementSizeInBytes] is read-only and can't be set.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic l = new Float64x2List(0);
  try {
    l.elementSizeInBytes = 2;
    Expect.fail("[elementSizeInBytes] should be read-only");
  } on NoSuchMethodError {}
}
