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
 * members that a class would allow. Test abstract members
 * @author ngl@unipro.ru
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

  String i;
  String get gi;
  set si(String v);
  String mi();
  String operator -();
}

class A implements B, C, I, J {
}

class MA extends A with M {
  String i = "MA.i";
  String get gi => i;
  set si(String v) {
    i = v;
  }
  String mi() => "MA.mi()";
  String operator -() => i.substring(0, 1);
}

main() {
  Expect.equals("S.s", M.s);
  Expect.equals("S.sf()", M.sf());
  Expect.equals("S.s", M.gs);
  M.ss = "x";
  Expect.equals("x", M.gs);

  MA ma = new MA();
  Expect.equals("MA.i", ma.i);
  Expect.equals("M", -ma);
  Expect.equals("MA.mi()", ma.mi());
  Expect.equals("MA.i", ma.gi);
  ma.si = "xx";
  Expect.equals("xx", ma.gi);
  Expect.equals("x", -ma);
}
