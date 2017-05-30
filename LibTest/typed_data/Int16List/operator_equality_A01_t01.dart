/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(other)
 * The equality operator.
 * The default behavior for all Objects is to return true if and only if [this]
 * and [other] are the same object.
 * @description Checks that only identical objects are equal.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var obj1 = new Int16List(0);
  var obj2 = new Int16List(0);
  var obj3 = obj1;

  Expect.isTrue(obj1 == obj3);
  Expect.isTrue(obj1 == obj1);
  Expect.isFalse(obj2 == obj3);
  Expect.isFalse(obj1 == obj2);
}
