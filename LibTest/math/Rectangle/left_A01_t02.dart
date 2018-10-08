/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T left
 * The x-coordinate of the left edge.
 * @description Checks that left is read-only and cannot be set.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  dynamic r = new Rectangle(1, 2, 3, 4);
  try {
    r.left = 5;
    Expect.fail("[left] should be read-only");
  } on NoSuchMethodError {}
}
