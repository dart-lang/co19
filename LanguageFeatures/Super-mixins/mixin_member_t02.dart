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
 * members that a class would allow. Test non abstract members
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class I {}
class J {}

class B {}
class C {}

mixin M on B, C implements I, J {
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
  int operator -() => i.length - 1;
}

class A implements B, C, I, J {
}

class MA extends A with M {
}

main() {
  Expect.equals("S.s", M.s);
  Expect.equals("S.sf()", M.sf());
  Expect.equals("S.s", M.gs);
  M.ss = "x";
  Expect.equals("x", M.gs);

  MA ma = new MA();
  Expect.equals(2, -ma);
  Expect.equals("M.i", ma.i);
  Expect.equals("M.mi()", ma.mi());
  Expect.equals("M.i", ma.gi);
  ma.si = "xx";
  Expect.equals("xx", ma.gi);
  Expect.equals(1, -ma);
}
