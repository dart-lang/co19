/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Variables can be assigned the result of expressions whose type is assignable to the type of the variable.
 * Otherwise, a type warning must be produced during static analysis.
 * @description Class B is not assignable to class A
 * @static-warning
 * @author msyabro
 * @reviewer akuznecov
 */

class A {}
class B {
  B() {}
}


main() { 
   A a;
   B b;
   a = b;
}
