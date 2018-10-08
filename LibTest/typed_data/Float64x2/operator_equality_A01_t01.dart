/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float64x2 operator ==(Float64x2 other)
 * The equality operator.
 * The default behavior for all Objects is to return true if and only if this
 * and other are the same object.
 * @description Checks that only the same objects are equal.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var obj1 = new Float64x2(1.0, 2.0);
  var obj2 = new Float64x2(1.0, 2.0);
  var obj3 = obj1;
  var obj4 = new Float64x2(1.0, 2.0);

  Expect.isTrue(obj1 == obj3);
  Expect.isTrue(obj1 == obj1);
  Expect.isFalse(obj2 == obj3);
  Expect.isFalse(obj1 == obj2);
  Expect.isFalse(obj1 == obj4);
}
