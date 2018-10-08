/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T bottom
 * The y-coordinate of the bottom edge.
 * @description Checks that bottom is read-only and cannot be set.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  dynamic r = new Rectangle(1, 2, 3, 4);
  try {
    r.bottom = 17;
    Expect.fail("[bottom] should be read-only");
  } on NoSuchMethodError {};
}
