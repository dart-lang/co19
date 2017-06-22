/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isNotEmpty
 * Returns true if there is at least one element in this collection.
 * @description Checks that [isNotEmpty] is read-only and can't be set.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic l = new Uint8ClampedList(0);

  try {
    l.isNotEmpty = false;
    Expect.fail("[isNotEmpty] should be read-only");
  } on NoSuchMethodError {}
}
