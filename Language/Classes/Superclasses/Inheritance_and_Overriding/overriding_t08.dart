/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let C = S0 be a class declared in library L, and let
 * {S1 ... Sk} be the set of all superclasses of C, where Si is the superclass
 * of Si-1 for i in 1..k. Let C declare a member m, and let m' be a member
 * of Sj for j in 1..k, that has the same name as m, such that m' is
 * accessible to L. Then m overrides m' if m' is not already overridden by a
 * member of at least one of S1 ... Sj-1 and neither m nor m' are fields.
 * @description Checks that m does not override m' if m' is not accessible. Test
 * type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

import "../../../../Utils/expect.dart";

typedef SAlias = S;

class C extends SAlias {
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
