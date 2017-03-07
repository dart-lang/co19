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
 * @description Checks that hash code is the same during execution of the test,
 * because object is equal to itself
 *
 * @author a.semenov@unipro.ru
 */
library hashCode_A01_t02;
import "../../../Utils/expect.dart";

test(Object create()){
  Object o = create();
  int h1 = o.hashCode;
  int h2 = o.hashCode;
  Expect.equals(h1, h2);
}
