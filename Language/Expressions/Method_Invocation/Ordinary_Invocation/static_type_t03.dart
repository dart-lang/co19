/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the static type of o.
 * ...
 * If T.m does not exist, or if F is not a function type, the static type of i
 * is Dynamic; otherwise the static type of i is the declared return type of F.
 * @description Checks static invocations, when T denotes a class in the
 * current scope. Static type of a static method invocation is the declared
 * return type of F.
 * @static-clean
 * @author msyabro
 * @reviewer rodionov
 */

class C {
  static int f1() {}
  static bool f2() {}
  static String f3() {}
  static C f4() {}
}

main() {
  int resultInt = C.f1();
  bool resultBool = C.f2();
  String resultString = C.f3();
  C resultC = C.f4();
}
