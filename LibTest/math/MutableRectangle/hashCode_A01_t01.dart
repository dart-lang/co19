/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int hashCode
 * The hash code for this object.
 * A hash code is a single integer which represents the state of the object that
 * affects == comparisons.
 * All objects have hash codes. The default hash code represents only the
 * identity of the object, the same way as the default == implementation only
 * considers objects equal if they are identical (see identityHashCode).
 * @description Checks that equals objects have equal hash codes and
 * different objects have different hash codes.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  var obj1 = new MutableRectangle(3, 5, 10, 8);
  var obj2 = new MutableRectangle(3, 5, 10, 8);
  var obj3 = new MutableRectangle(1, 2, 10, 8);
  Expect.isTrue(obj1.hashCode == obj1.hashCode);
  Expect.isTrue(obj1.hashCode == obj2.hashCode);
  Expect.isFalse(obj1.hashCode == obj3.hashCode);
  Expect.isFalse(obj2.hashCode == obj3.hashCode);
}
