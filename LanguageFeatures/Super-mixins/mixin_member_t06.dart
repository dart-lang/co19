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
 * members that a class would allow. Test non-abstract members and type
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

mixin M<X extends num, Y extends num> on B<X>, C<Y> implements I<S>, J<T> {
  static String s = "S.s";
  static String get gs => s;
  static set ss(String v) {
    s = v;
  }
  static String sf() => "S.sf()";

  Y i = 2.0 as Y;
  Y get gi => i;
  set si(Y v) {
    i = v;
  }
  Y mi() => 22.0 as Y;
  Type operator ~() => i.runtimeType;
}

class A<T1, T2, T3, T4> implements B<T1>, C<T2>, I<T3>, J<T4> {
}

class MA<X1 extends num, Y1 extends num> extends A<X1, Y1, S, T> with M<X1, Y1>  {
}

main() {
  Expect.equals("S.s", M.s);
  Expect.equals("S.sf()", M.sf());
  Expect.equals("S.s", M.gs);
  M.ss = "x";
  Expect.equals("x", M.gs);

  MA ma = new MA<int, double>();
  Expect.equals(double, ~ma);
  Expect.equals(2.0, ma.i);
  Expect.equals(22.0, ma.mi());
  Expect.equals(2.0, ma.gi);
  ma.si = 3.14;
  Expect.equals(3.14, ma.gi);
}
