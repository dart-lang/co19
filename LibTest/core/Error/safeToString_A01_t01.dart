/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String safeToString(Object object)
 * Safely convert a value to a String description.
 * The conversion is guaranteed to not throw, so it won't use the object's
 * toString method.
 * @description Checks that this method doesn't use object's toString method
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class C {
  String toString() {
    Expect.fail("toString shouldn't be called");
  }
}

main() {
  C c = new C();
  Error.safeToString(c);
}
