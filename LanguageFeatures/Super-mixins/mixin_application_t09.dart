/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Mixin application semantics is mostly unchanged, except that it's
 * a compile-time error to apply a mixin to a class that doesn't implement all
 * the 'on' type requirements of the mixin declaration, or apply a mixin
 * containing super-invocations to a class that doesn't have a concrete
 * implementation of the super-invoked members compatible with the
 * super-constraint interface.
 *
 * @description Checks that there is no compile error if a mixin is applied to a
 * class that implements all the 'on' type requirements of the mixin
 * declaration. Test 'implements' implementation of 'on' clause interfaces
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class S {}
class T {}
class X extends S {}
class Y extends T {}

String console;

class A<T1> {
  String get a1 => "A.a1";
  set a2(String v) {
    console = "A:$v";
  }
  String a3() => "A.a3";
  String operator ~() => a1.substring(0, 1);
}
abstract class B<T1> {
  String get b1;
  void set b2(String v);
  String b3();
  String operator -() => b1.substring(0, 1);
}
class C<T1, S1> implements A<T1>, B<S1> {
  String get a1 => "C.a1";
  set a2(String v) {
    console = "C:$v";
  }
  String a3() => "C.a3";
  String operator ~() => a1.substring(0, 3);

  String get b1 => "C.b1";
  void set b2(String v) {
    console = "C:$v";
  }
  String b3() => "C.b3";
  String operator -() => b1.substring(0, 3);
}

mixin M<X1 extends S, Y1 extends T> on A<Y1>, B<X1> {
  String get m1 => "m1";
  void set m2(String v) {
    console = "M:$v";
  }
  String m3() => "m3";
}

class MA<X1 extends S, Y1 extends T> extends C<Y1, X1> with M<X1, Y1> {
}

main() {
  MA<X, Y> ma = new MA<X, Y>();

  Expect.equals("C.a1", ma.a1);
  ma.a2 = "a2";
  Expect.equals("C:a2", console);
  Expect.equals("C.a3", ma.a3());
  Expect.equals("C.a", ~ma);

  Expect.equals("C.b1", ma.b1);
  ma.b2 = "b2";
  Expect.equals("C:b2", console);
  Expect.equals("C.b3", ma.b3());
  Expect.equals("C.b", -ma);

  Expect.equals("m1", ma.m1);
  ma.m2 = "m2";
  Expect.equals("M:m2", console);
  Expect.equals("m3", ma.m3());
}
