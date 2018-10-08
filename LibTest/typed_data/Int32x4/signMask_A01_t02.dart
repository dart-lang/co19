/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int signMask
 * Extract the top bit from each lane return them in the first 4 bits. "x" lane
 * is bit 0. "y" lane is bit 1. "z" lane is bit 2. "w" lane is bit 3.
 * @description Checks that the signMask is read-only and cannot be set.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic obj = new Int32x4(1, 2, 3, 4);
  try {
    obj.signMask = 0;
    Expect.fail("[signMask] should be read-only");
  } on NoSuchMethodError {}
}
