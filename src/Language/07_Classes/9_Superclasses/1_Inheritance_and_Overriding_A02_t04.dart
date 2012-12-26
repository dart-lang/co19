/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let C be a class declared in library L, with superclass S and let
 * C declare an instance member m, and assume S declares an instance member 'm'
 * with the same name as m. Then m overrides m iff m is accessible (3.2) to L,
 * m has the same name as m and neither m nor m are fields.
 * Fields never override each other. The getters and setters induced by fields do.
 * @description Checks that m does not override m' if m' is not accessible.
 * @author iefremov
 * @reviewer rodionov
 */

import "1_Inheritance_and_Overriding_A02_t04_lib.dart";

class C extends S {
  _foo(var arg) { return 'B'; }
  _bar([y]) {return "bary";}
  _g() {return "g";}
}

main() {
  C a = new C();
  Expect.equals("B", a._foo(0));
  Expect.equals("bary", a._bar());
  Expect.equals("g", a._g());
}
