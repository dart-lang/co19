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
 * @description Checks that various valid setter declarations do not cause any
 * errors.
 * @author iefremov
 */

abstract class A<U, V> {
  void set s2(var x) {}
  set s4(var x) {}

  void set s5(var x);
  set s6(var x);

  void set s7(U x) {}
  set s8(V x) {}
}

class C<U, V> extends A<U, V> {
  static void set s1(var x) {}
  static set s3(var x) {}

  void set s5(var x) {}
  set s6(var x) {}
}

main() {
  // don't need a try/catch block here, we don't want to hide an exception
  C.s1 = null;
  C.s3 = null;
  new C().s2 = null;
  new C().s4 = null;
  new C<int, double>().s7 = null;
  new C<C, C>().s8 = null;
}
