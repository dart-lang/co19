/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * setterSignature:
 *   returnType? set identifier formalParameterList
 * ;
 * @description Checks that various valid setter declarations do not cause any
 * errors. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

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

typedef CAlias<U, V> = C<U, V>;

main() {
  CAlias.s1 = null;
  CAlias.s3 = null;
  new CAlias().s2 = null;
  new CAlias().s4 = null;
  new CAlias<int, double>().s7 = null;
  new CAlias<C, C>().s8 = null;
}
