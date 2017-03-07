/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int hashCode
 * Get a hash code for this object.
 *
 * All objects have hash codes. Hash codes are guaranteed to be the same for
 * objects that are equal when compared using the equality operator ==. Other
 * than that there are no guarantees about the hash codes. They will not be
 * consistent between runs and there are no distribution guarantees.
 *
 * @description Checks that if objects are equal by equality operator == then
 * their hash codes are equal
 *
 * @author sgrekhov@unipro.ru
 */
library hashCode_A01_t03;
import "../../../Utils/expect.dart";

test(List<Object> createEqual(int number)) {
  List<Object> objects = createEqual(2);
  Expect.isTrue(objects[0] == objects[1]);
  Expect.equals(objects[0].hashCode, objects[1].hashCode);
}

