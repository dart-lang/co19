/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T x
 * @description Checks that [x] read-only and cannot be set.
 * @note undocumented
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";


main() {
  dynamic r = new Point(3, 5);
  try {
    r.x = 1;
    Expect.fail("[x] should be read-only");
  } on NoSuchMethodError {}
}
