/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int hashCode
 * Get a hash code for this object.
 * All objects have hash codes. Hash codes are guaranteed to be the same for
 * objects that are equal when compared using the equality operator ==.
 * @description Checks that equal objects have equal hash codes and different
 * objects have different hash codes.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var obj1 = new Float64x2List(2);
  var obj2 = new Float64x2List(2);
  var obj3 = obj1;

  Expect.isTrue(obj1.hashCode == obj3.hashCode);
  Expect.isTrue(obj2.hashCode == obj2.hashCode);
  Expect.isFalse(obj2.hashCode == obj1.hashCode);
  Expect.isFalse(obj2.hashCode == obj3.hashCode);
}
