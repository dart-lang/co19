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
 * @description Checks that an instance method can override another instance
 * method. Test type aliases
 * @author sgrekhov@unipro.ru
 */
import "../../../../Utils/expect.dart";

class A {
  foo() { return 'A'; }
}

class B extends A {
  foo() { return 'B'; }
}

main() {
  A a = new B();
  Expect.equals('B', a.foo());
}
