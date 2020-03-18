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
 * Test e ?.. m()?.f()
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
  A? a1 = new A();
  A? a2 = new A();
  int counter1 = 0;
  int counter2 = 0;

  A? m1() {
    counter1++;
    return a1;
  }
  A? m2() {
    counter2++;
    return a2;
  }
}

main() {
  C c1 = new C();
  var actual1 = c1 ?.. m1()?.m();   /// static type warning
  var expected = c1;
  Expect.equals(expected, actual1);
  var val1 =  c1.m1();
  if (val1 != null) {
    Expect.equals(1, val1.counter);
  }

  var actual2 = c1
    ?.. m1()?.m()                    /// static type warning
    .. m2()?.m();
  Expect.equals(expected, actual2);
  var val2 = c1.m1();
  if (val2 != null) {
    Expect.equals(2, val2.counter);
  }
  var val3 = c1.m2();
  if (val3 != null) {
    Expect.equals(1, val3.counter);
  }

  c1.a1 = null;
  var actual3 = c1 ?.. m1()?.m();     /// static type warning
  Expect.equals(expected, actual3);
  Expect.equals(5, c1.counter1);

  var actual4 = c1
      ?.. m1()?.m()                   /// static type warning
      .. m2()?.m();
  Expect.equals(expected, actual4);
  var val4 = c1.m2();
  if (val4 != null) {
    Expect.equals(2, val4.counter);
  }

  C? c2 = null;
  var actual5 = c2 ?.. m1()?.m();
  Expect.isNull(actual5);

  if (c2 != null) {
    var actual6 = c2
      ?.. m1()?.m()                     /// static type warning
      .. m2()?.m();
    Expect.isNull(actual6);
  }

  c2 = new C();
  var actual7 = c2 ?.. m1()?.m();       /// static type warning
  var expected2 = c2;
  Expect.equals(expected2, actual7);
  var val5 = c2?.m1();                  /// static type warning
  if (val5 != null) {
    Expect.equals(1, val5.counter);
  }

  var actual8 = c2
      ?.. m1()?.m()                     /// static type warning
      .. m2()?.m();
  Expect.equals(expected2, actual8);
  var val6 = c2.m1();
  if (val6 != null) {
    Expect.equals(2, val6.counter);
  }
  var val7 = c2.m2();
  if (val7 != null) {
    Expect.equals(1, val7.counter);
  }

  c1.a1 = null;
  var actual9 = c1 ?.. m1()?.m();     /// static type warning
  Expect.equals(expected, actual9);
  Expect.equals(7, c1.counter1);

  var actual10 = c1
      ?.. m1()?.m()                   /// static type warning
      .. m2()?.m();
  Expect.equals(expected, actual10);
  var val8 = c1.m2();
  if (val8 != null) {
    Expect.equals(3, val8.counter);
  }
  Expect.equals(8, c1.counter1);
}
