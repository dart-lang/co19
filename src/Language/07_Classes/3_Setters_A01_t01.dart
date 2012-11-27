/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * setterSignature:
 * static? returnType? set identifier formalParameterList
 * ;
 * @description Checks that various valid setter declarations do not cause any errors.
 * Note: using non-void return type will cause a static warning.
 * @static-warning
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer rodionov
 */

class C<U, V> {
  static int set s1(var x){}
  int set s2(var x){}
  static set s3(var x){}
  set s4(var x){}

  int set s5(var x);
  set s6(var x);

  V set s7(U x){}
  set s8(V x){}

  U set s9(V x);
  set s10(U x);

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
