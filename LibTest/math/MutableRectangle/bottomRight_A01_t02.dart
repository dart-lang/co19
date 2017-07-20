/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Point<T> bottomRight
 * Point<T> get bottomRight =>
 *   new Point<T>(this.left + this.width, this.top + this.height);
 * @description Checks that bottomRight is read-only and cannot be set.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  dynamic r = new MutableRectangle(2, 1, 20, 15);
  try {
    r.bottomRight = new Point(1, 1);
    Expect.fail("[bottomRight] should be read-only");
  } on NoSuchMethodError {};
}
