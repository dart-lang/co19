/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T height
 * The height of the rectangle.
 * @description Checks that height is read-only and cannot be set.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  dynamic r = new Rectangle(1, 2, 3, 4);
  try {
    r.height = 5;
    Expect.fail("[height] should be read-only");
  } on NoSuchMethodError {}
}
