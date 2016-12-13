/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
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
 * @description Checks that if objects are equal by equality operator == then
 * they hash codes are equal
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Object o1 = new Object();
  Object o2 = o1;

  Expect.equals(o1.hashCode, o2.hashCode);
}
