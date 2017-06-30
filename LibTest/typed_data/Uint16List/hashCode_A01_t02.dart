/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int hashCode
 * Get a hash code for this object. All objects have hash codes. Hash codes are
 * guaranteed to be the same for objects that are equal when compared using the
 * equality operator ==.
 * @description Checks that [hashCode] is read-only and can't be set.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic list = new Uint16List(0);
  try {
    list.hashCode = 1;
    Expect.fail("[hashCode] should be read-only");
  } on NoSuchMethodError {}
}
