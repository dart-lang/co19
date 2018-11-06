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
 * members that a class would allow. Test abstract members and type parameters
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class S {}
class T {}
class X extends S {}
class Y extends T {}

class I<T> {}
class J<T> {}
class B<T> {}
class C<T> {}

mixin M<X extends S, Y extends T> on B<X>, C<Y> implements I<S>, J<T> {
  static String s = "S.s";
  static String get gs => s;
  static set ss(String v) {
    s = v;
  }
  static String sf() => "S.sf()";

  String i;
  String get gi;
  set si(String v);
  String mi();
  String operator +(MA v);
}

class A<T1, T2, T3, T4> implements B<T1>, C<T2>, I<T3>, J<T4> {
}

class MA extends A<X, Y, S, T> with M<X, Y> {
  String i = "MA.i";
  String get gi => i;
  set si(String v) {
    i = v;
  }
  String mi() => "MA.mi()";
  String operator +(MA v) => i + '+1';
}

main() {
  Expect.equals("S.s", M.s);
  Expect.equals("S.sf()", M.sf());
  Expect.equals("S.s", M.gs);
  M.ss = "x";
  Expect.equals("x", M.gs);

  MA ma = new MA();
  Expect.equals("MA.i+1", ma + ma);
  Expect.equals("MA.i", ma.i);
  Expect.equals("MA.mi()", ma.mi());
  Expect.equals("MA.i", ma.gi);
  ma.si = "xx";
  Expect.equals("xx", ma.gi);
  Expect.equals("xx+1", ma + ma);
}
