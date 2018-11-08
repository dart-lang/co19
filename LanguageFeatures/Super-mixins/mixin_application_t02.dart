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
 * declaration. Test 'extends' implementation of 'on' clause interfaces and
 * 'implements' part of the mixin
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

String console;

class I {
  String get i1 => "I.i1";
  set i2(String v) {
    console = "I:$v";
  }
  String i3() => "I.i3";
  String operator ~() => i1.substring(0, 2);
}
abstract class J {
  String get j1;
  void set j2(String v);
  String j3();
  String operator -();
}

class A {
  String get a1 => "A.a1";
  set a2(String v) {
    console = "A:$v";
  }
  String a3() => "A.a3";
  String operator +(A v) => v.a1.substring(0, 1);
}
abstract class B extends A {
  String get b1;
  void set b2(String v);
  String b3();
  String operator -(B v);
}
class C extends B implements J {
  String get b1 => "C.b1";
  void set b2(String v) {
    console = "C:$v";
  }
  String b3() => "C.b3";
  String operator -(B v) => v.b1.substring(0, 1);

  String get j1 => "J.j1";
  set j2(String v) {
    console = "J:$v";
  }
  String j3() => "J.j3";
  String operator -() => j1.substring(0, 1);
}

mixin M on A, B implements I, J {
  String get m1 => "m1";
  void set m2(String v) {
    console = "M:$v";
  }
  String m3() => "m3";

  String get i1 => "I.i1";
  set i2(String v) {
    console = "I:$v";
  }
  String i3() => "I.i3";
  String operator ~() => i1.substring(0, 1);
}

class MA extends C with M {
}

main() {
  MA ma = new MA();

  Expect.equals("A.a1", ma.a1);
  ma.a2 = "a2";
  Expect.equals("A:a2", console);
  Expect.equals("A.a3", ma.a3());
  Expect.equals("A", ma + ma);

  Expect.equals("C.b1", ma.b1);
  ma.b2 = "b2";
  Expect.equals("C:b2", console);
  Expect.equals("C.b3", ma.b3());
  Expect.equals("C", ma - ma);

  Expect.equals("m1", ma.m1);
  ma.m2 = "m2";
  Expect.equals("M:m2", console);
  Expect.equals("m3", ma.m3());

  Expect.equals("I", ~ma);
  Expect.equals("J", -ma);
}
