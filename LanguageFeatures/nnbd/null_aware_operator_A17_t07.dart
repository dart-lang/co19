/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A null-shorting cascade expression e?..s translates as follows,
 * where x and y are fresh object level variables.
 *  fn[k : Exp -> Exp] : Exp =>
 *  let x = EXP(e) in x == null ? null : let y = EXP(x.s) in k(x)
 *
 * @description Check that a null-shorting cascade expression e?..s translates
 * as follows, where x and y are fresh object level variables.
 *  fn[k : Exp -> Exp] : Exp =>
 *  let x = EXP(e) in x == null ? null : let y = EXP(x.s) in k(x)
 * Test e ?.. m().n()
 * @static-warning
 * @author sgrekhov@unipro.ru
 * @issue 39141
 * @issue 40959
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";
class A {
  int counter = 0;
  String m() {
    counter++;
    return "Lily was here";
  }
}

class C {
  A a1 = new A();
  A a2 = new A();
  int counter1 = 0;
  int counter2 = 0;

  A m1() {
    counter1++;
    return a1;
  }
  A m2() {
    counter2++;
    return a2;
  }
}

main() {
  C c1 = new C();
  var actual1 = c1 ?.. m1().m();        /// static type warning
  var expected = c1;
  Expect.equals(expected, actual1);
  Expect.equals(1, c1.m1().counter);

  var actual3 = c1
    ?.. m1().m()                        /// static type warning
    .. m2().m();
  Expect.equals(expected, actual3);
  Expect.equals(2, c1.m1().counter);
  Expect.equals(1, c1.m2().counter);

  C? c2 = null;
  var actual4 = c2 ?.. m1().m();
  Expect.isNull(actual4);

  var actual6 = c2
    ?.. m1().m()
    .. m2().m();
  Expect.isNull(actual6);

  c2 = new C();
  var actual7 = c2 ?.. m1().m();
  var expected2 = c2;
  Expect.equals(expected2, actual7);
  Expect.equals(1, c2?.m1().counter);

  var actual9 = c2
      ?.. m1().m()
      .. m2().m();
  Expect.equals(expected2, actual9);
  Expect.equals(2, c2.m1().counter);
  Expect.equals(1, c2.m2().counter);
}
