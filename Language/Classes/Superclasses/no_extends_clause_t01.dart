/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If no extends clause is specified, then either:
 * - C is Object, which has no superclass. OR
 * - The superclass of C is Object.
 * @description Checks that in absence of an extends clause, a class still
 * extends Object.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

class A {}

main() {
  A a = new A();
  Expect.isTrue(a is Object);
}
