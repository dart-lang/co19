/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An import specifies a URI where the declaration of the imported library
 * is to be found. The effect of an import of library B with prefix P within the
 * declaration of library A is:
 * - If P is the empty string, each non-private top level declaration d of B is
 * added to the scope of A.
 * - Otherwise, each non-private top level declaration d of B is added to the
 * scope of A under the name P.d, as is the name P.
 * @description Checks that if P is not empty string, each non-private top level 
 * declaration d of B is added to the scope of A under the name P.d, as is the name P.
 * @author vasya
 * @reviewer msyabro
 */

#import("1_Imports_A02_lib.dart", prefix: "P");

main() {
  Expect.equals("A_FOO", P.aFoo);
  Expect.equals('aFunc', P.aFunc());
  P.aTypeAlias ff = (bool b, String s) {};

  P.A a = new P.A();
  P.J j = new P.J();

  Expect.equals('A.FOO', P.A.FOO);
  Expect.equals("1_Imports_A02_lib.bar", a.bar);
  Expect.equals('J.FOO', P.J.FOO);
}