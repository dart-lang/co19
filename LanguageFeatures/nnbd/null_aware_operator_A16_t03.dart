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
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../Utils/expect.dart";
import "legacy_lib.dart";

main() {
  A a1 = new A();

  var actual1 = a1 .. test();
  var expected = a1;
  Expect.equals(expected, actual1);
  Expect.equals("test() called 1 times, text2 called 0 times", a1.log);

  var actual2 = a1 .. text2;
  Expect.equals(expected, actual2);
  Expect.equals("test() called 1 times, text2 called 1 times", a1.log);

  var actual3 = a1 .. test() .. text2;
  Expect.equals(expected, actual3);
  Expect.equals("test() called 2 times, text2 called 2 times", a1.log);

  A? a2 = new A();
  if (a2 != null) {
    var actual4 = a2 .. test();
    var expected2 = a2;
    Expect.equals(expected2, actual4);
    Expect.equals("test() called 1 times, text2 called 0 times", a2.log);

    var actual5 = a2 .. text2;
    Expect.equals(expected2, actual5);
    Expect.equals("test() called 1 times, text2 called 1 times", a2.log);

    var actual6 = a2 .. test() .. text2;
    Expect.equals(expected2, actual6);
    Expect.equals("test() called 2 times, text2 called 2 times", a2.log);
  }
}
