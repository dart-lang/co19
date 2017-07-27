/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Point<T> topRight
 * Point<T> get topRight => new Point<T>(this.left + this.width, this.top);
 * @description Checks that topRight is read-only and cannot be set.
 * @note undocumented
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  dynamic r = new Rectangle(1, 2, 3, 4);
  try {
    r.topRight = 17;
    Expect.fail("[topRight] should be read-only");
  } on NoSuchMethodError {};
}
