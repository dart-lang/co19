/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A cascade expression e..s translates as follows, where F is the
 * translation of e and x and y are fresh object level variables:
 *  fn[k : Exp -> Exp] : Exp =>
 *      F[fn[r : Exp] : Exp => let x = r in
 *                             let y = EXP(x.s)
 *                             in k[x]
 *  ]
 *
 * @description Check that a cascade expression e..s translates as follows,
 * where F is the translation of e and x and y are fresh object level variables:
 *  fn[k : Exp -> Exp] : Exp =>
 *      F[fn[r : Exp] : Exp => let x = r in
 *                             let y = EXP(x.s)
 *                             in k[x]
 *  ]
 *  Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong
import "../../../Utils/expect.dart";

class C {
  int c1 = 0, c2 = 0;
  String get log => "test1 called $c1 times, test2() called $c2 times";

  String get test1 {
    c1++;
    return "Show must go on";
  }

  String test2() {
    c2++;
    return "Let it be";
  }
}

typedef CAlias1 = C;
typedef CAlias2 = C?;

main() {
  CAlias1 c1 = new C();

  var actual1 = c1 .. test1;
  var expected = c1;
  Expect.equals(expected, actual1);
  Expect.equals("test1 called 1 times, test2() called 0 times", c1.log);

  var actual2 = c1 .. test2();
  Expect.equals(expected, actual2);
  Expect.equals("test1 called 1 times, test2() called 1 times", c1.log);

  var actual3 = c1
    .. test1
    .. test2();
  Expect.equals(expected, actual3);
  Expect.equals("test1 called 2 times, test2() called 2 times", c1.log);

  CAlias1? c2 = new C();
  if (c2 != null) {
    var actual4 = c2 .. test1;
    var expected2 = c2;
    Expect.equals(expected2, actual4);
    Expect.equals("test1 called 1 times, test2() called 0 times", c2.log);

    var actual5 = c2 .. test2();
    Expect.equals(expected2, actual5);
    Expect.equals("test1 called 1 times, test2() called 1 times", c2.log);

    var actual6 = c2 .. test1 .. test2();
    Expect.equals(expected2, actual6);
    Expect.equals("test1 called 2 times, test2() called 2 times", c2.log);
  }

  CAlias2 c3 = new C();
  if (c3 != null) {
    var actual7 = c3 .. test1;
    var expected3 = c3;
    Expect.equals(expected3, actual7);
    Expect.equals("test1 called 1 times, test2() called 0 times", c3.log);

    var actual8 = c3.. test2();
    Expect.equals(expected3, actual8);
    Expect.equals("test1 called 1 times, test2() called 1 times", c3.log);

    var actual9 = c3
      .. test1
      .. test2();
    Expect.equals(expected3, actual9);
    Expect.equals("test1 called 2 times, test2() called 2 times", c3.log);
  }

  CAlias2? c4 = new C();
  if (c4 != null) {
    var actual10 = c4 .. test1;
    var expected4 = c4;
    Expect.equals(expected4, actual10);
    Expect.equals("test1 called 1 times, test2() called 0 times", c4.log);

    var actual5 = c4 .. test2();
    Expect.equals(expected4, actual10);
    Expect.equals("test1 called 1 times, test2() called 1 times", c4.log);

    var actual6 = c4
      .. test1
      .. test2();
    Expect.equals(expected4, actual10);
    Expect.equals("test1 called 2 times, test2() called 2 times", c4.log);
  }
}
