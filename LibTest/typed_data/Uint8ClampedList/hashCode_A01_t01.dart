/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int hashCode
 * The hash code for this object.
 * A hash code is a single integer which represents the state of the object that
 * affects == comparisons.
 * @description Checks that equals objects have equal hash codes and different
 * objects have different hash codes.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";


main() {
  var obj1 = new Uint8ClampedList(0);
  var obj2 = new Uint8ClampedList(0);
  var obj3 = obj1;

  Expect.isTrue(obj1.hashCode == obj3.hashCode);
  Expect.isTrue(obj1.hashCode == obj1.hashCode);
  Expect.isFalse(obj2.hashCode == obj3.hashCode);
  Expect.isFalse(obj1.hashCode == obj2.hashCode);
}
