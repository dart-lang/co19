/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The mixinMember production allows the same instance or static
 * members that a class would allow, but no constructors (for now).
 *
 * @description Checks that mixin declaration allows same instance or static
 * members that a class would allow. Test non abstract members and type
 * parameters
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class S {}
class T {}
class X extends S {}
class Y extends T {}

class I<T1> {}
class J<T1> {}
class B<T1> {}
class C<T1> {}

mixin M<X extends S, Y extends T> on B<X>, C<Y> implements I<S>, J<T> {
  static String s = "S.s";
  static String get gs => s;
  static set ss(String v) {
    s = v;
  }
  static String sf() => "S.sf()";

  String i = "M.i";
  String get gi => i;
  set si(String v) {
    i = v;
  }
  String mi() => "M.mi()";
  int operator +(MA v) => v.i.length * 2;
}

class A<T1, T2, T3, T4> implements B<T1>, C<T2>, I<T3>, J<T4> {
}

class MA extends A<X, Y, S, T> with M<X, Y> {
}

main() {
  Expect.equals("S.s", M.s);
  Expect.equals("S.sf()", M.sf());
  Expect.equals("S.s", M.gs);
  M.ss = "x";
  Expect.equals("x", M.gs);

  MA ma = new MA();
  Expect.equals(6, ma + ma);
  Expect.equals("M.i", ma.i);
  Expect.equals("M.mi()", ma.mi());
  Expect.equals("M.i", ma.gi);
  ma.si = "xx";
  Expect.equals("xx", ma.gi);
  Expect.equals(4, ma + ma);
}
