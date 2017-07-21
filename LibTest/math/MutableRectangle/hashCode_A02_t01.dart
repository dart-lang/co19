/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int hashCode
 * ...
 * Hash codes must be the same for objects that are equal to each other
 * according to ==. The hash code of an object should only change if the object
 * changes in a way that affects equality.
 * @description Checks that hash codes must be the same for objects that are
 * equal to each other according to ==.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  var obj1 = new MutableRectangle(3, 5, 10, 8);
  var obj2 = new MutableRectangle(3, 5, 10, 8);

  Expect.isTrue(obj1 == obj2);
  Expect.isTrue(obj1.hashCode == obj2.hashCode);

  obj1.top = 1;
  Expect.isFalse(obj1 == obj2);
  Expect.isFalse(obj1.hashCode == obj2.hashCode);

  obj2.top = 1;
  Expect.isTrue(obj1 == obj2);
  Expect.isTrue(obj1.hashCode == obj2.hashCode);
}
