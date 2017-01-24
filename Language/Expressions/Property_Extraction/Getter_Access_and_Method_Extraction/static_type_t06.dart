/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of i is:
 * • The declared return type of T.m, if T has an accessible instance getter
 *   named m.
 * • The declared return type of m, if T is Type, e is a constant type literal
 *   and the class corresponding to e declares an accessible static getter
 *   named m.
 * • The static type of function T.m if T has an accessible instance method
 *   named m.
 * • The static type of function m, if T is Type, e is a constant type literal
 *   and the class corresponding to e declares an accessible static method
 *   named m.
 * • The type dynamic otherwise.
 * @description Checks that the static type of a getter invocation expression
 * of the form C.m is the declared return type of the getter.
 * @static-clean
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  static int get v {}
}

class B {
  static bool get v {}
}

class C {
  static String get v {}
}

class D {
  static double v;
}

main()  {
  int resInt = A.v;
  bool resBool = B.v;
  String resString = C.v;
  double resDbl = D.v;
}
