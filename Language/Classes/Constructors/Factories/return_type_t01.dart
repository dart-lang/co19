/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The return type of a factory whose signature is of the
 * form factory M or the form factory M.id is M if M is not a generic type;
 * otherwise the return type is M <T1, …, Tn>, where T1, …, Tn are the type
 * parameters of the enclosing class.
 * @description Checks that result of invoking factory constructor of the form
 * M or M.id can be assigned to the variables whose types are assignable to M
 * and no static warnings are produced.
 * @static-clean
 * @note This test only makes sense in checked mode.
 * @author iefremov
 */

class S {}

class A extends S {
  A.g() {}
  factory A() {}
  factory A.bcd() {}
}

class D extends A {
  D():super.g();
}

main() {
  A a = new A();
  S s = new A();
  D d = new A();

  a = new A.bcd();
  s = new A.bcd();
  d = new A.bcd();
}
