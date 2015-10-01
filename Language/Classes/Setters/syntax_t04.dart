/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * setterSignature:
 *   returnType? set identifier formalParameterList
 * ;
 * methodSignature:
 *   static? setterSignature
 * ;
 * @description Checks if setter return value ohter than void is specified
 * then no error occurs
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class C {
  String set s1(int value) {return "1";} /// static warning
  static int set s2(int value) {return 2;} /// static warning
}

main() {
  C c = new C();
  // There is no way to check setter return value. Return value of assignment
  // e1.v = e2; is always e2. So just call setters to check that there's no
  // error
  Expect.equals(0, c.s1 = 0);
  Expect.equals(0, C.s2 = 0);
}
