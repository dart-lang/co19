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
 * Test cascade assignment
 * @static-warning
 * @author sgrekhov@unipro.ru
 * @issue 39141
 * @issue 40959
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class C {
  String test1 = "Lily was here";
  String _test2 = "";
  void set test2(String val) {
    _test2 = val;
  }
}

main() {
  C c1 = new C();
  var actual1 = c1 ?.. test1 = "Show must go on";     /// static type warning
  var expected = c1;
  Expect.equals(expected, actual1);
  Expect.equals("Show must go on", c1.test1);

  var actual2 = c1 ?.. test2 = "Lily was here";       /// static type warning
  Expect.equals(expected, actual2);
  Expect.equals("Lily was here", c1._test2);

  var actual3 = c1
    ?.. test1 = "Let it be"                           /// static type warning
    .. test2 = "Let it be";
  Expect.equals(expected, actual3);
  Expect.equals("Let it be", c1.test1);
  Expect.equals("Let it be", c1._test2);

  C? c2 = null;
  var actual4 = c2 ?.. test1 = "Show must go on";
  Expect.isNull(actual4);

  var actual5 = c2 ?.. test2 = "Show must go on";
  Expect.isNull(actual5);

  var actual6 = c2
    ?.. test1 = "Show must go on"
    .. test2 = "Show must go on";
  Expect.isNull(actual6);

  c2 = new C();
  var actual7 = c2 ?.. test1  = "Let it be";
  var expected2 = c2;
  Expect.equals(expected2, actual7);
  Expect.equals("Let it be", c2?.test1);

  var actual8 = c2 ?.. test2 = "Let it be";
  Expect.equals(expected2, actual8);
  Expect.equals("Let it be", c2?._test2);

  var actual9 = c2
      ?.. test1 = "Show must go on"
      .. test2 = "Show must go on";
  Expect.equals(expected2, actual9);
  Expect.equals("Show must go on", c2?.test1);
  Expect.equals("Show must go on", c2?._test2);
}
