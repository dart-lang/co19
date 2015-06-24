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
 * @description Checks setter returns expected value
 * @author sgrekhov
 */
import "../../Utils/expect.dart";

class C {
  int set s1(int value) {return 1;}
  static int set s2(int value) {return 2;}
}

main() {
  C c = new C();
  Expect.equals(1, c.s1 = 0, "Static getter should return expected value");
  Expect.equals(2, C.s2 = 0, "Static getter should return expected value");
}
