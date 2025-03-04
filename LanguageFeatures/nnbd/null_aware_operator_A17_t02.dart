// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A null-shorting cascade expression e?..s translates as follows,
/// where x and y are fresh object level variables.
///  fn[k : Exp -> Exp] : Exp =>
///  let x = EXP(e) in x == null ? null : let y = EXP(x.s) in k(x)
///
/// @description Check that a null-shorting cascade expression e?..s translates
/// as follows, where x and y are fresh object level variables.
///  fn[k : Exp -> Exp] : Exp =>
///  let x = EXP(e) in x == null ? null : let y = EXP(x.s) in k(x)
/// Test type aliases
/// @author sgrekhov@unipro.ru
/// @issue 39141

import '../../Utils/expect.dart';

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
  var actual1 = c1 ?.. test1;
//                 ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR

  var expected = c1;
  Expect.equals(expected, actual1);
  Expect.equals("test1 called 1 times, test2() called 0 times", c1.log);

  var actual2 = c1 ?.. test2();
//                 ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR

  Expect.equals(expected, actual2);
  Expect.equals("test1 called 1 times, test2() called 1 times", c1.log);

  var actual3 = c1
    ?.. test1
//  ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    .. test2();
  Expect.equals(expected, actual3);
  Expect.equals("test1 called 2 times, test2() called 2 times", c1.log);

  CAlias1? c2 = null;
  var actual4 = c2 ?.. test1;
  Expect.isNull(actual4);

  var actual5 = c2 ?.. test2();
  Expect.isNull(actual5);

  var actual6 = c2
    ?.. test1
    .. test2();
  Expect.isNull(actual6);

  c2 = new C();
  var actual7 = c2 ?.. test1;
//                 ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  var expected2 = c2;
  Expect.equals(expected2, actual7);
  Expect.equals("test1 called 1 times, test2() called 0 times", c2?.log);
//                                                                ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR

  var actual8 = c2 ?.. test2();
//                 ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.equals(expected2, actual8);
  Expect.equals("test1 called 1 times, test2() called 1 times", c2?.log);
//                                                                ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR

  var actual9 = c2
      ?.. test1
//    ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
      .. test2();
  Expect.equals(expected2, actual9);
  Expect.equals("test1 called 2 times, test2() called 2 times", c2?.log);
//                                                                ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  CAlias2 c3 = new C();
  var actual10 = c3 ?.. test1;
//                  ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  var expected3 = c3;
  Expect.equals(expected3, actual10);
  if (c3 != null) {
    Expect.equals("test1 called 1 times, test2() called 0 times", c3.log);
  }

  var actual11 = c3 ?.. test2();
//                  ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR

  Expect.equals(expected3, actual11);
  if (c3 != null) {
    Expect.equals("test1 called 1 times, test2() called 1 times", c3.log);
  }

  var actual12 = c3
      ?.. test1
//    ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR

  .. test2();
  Expect.equals(expected3, actual12);
  if (c3 != null) {
    Expect.equals("test1 called 2 times, test2() called 2 times", c3.log);
  }

  CAlias2? c4 = null;
  var actual13 = c4 ?.. test1;
  Expect.isNull(actual13);

  var actual14 = c4 ?.. test2();
  Expect.isNull(actual14);

  var actual15 = c4
      ?.. test1
  .. test2();
  Expect.isNull(actual15);

  c4 = new C();
  var actual16 = c4 ?.. test1;
//                  ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR

  var expected4 = c4;
  Expect.equals(expected4, actual16);
  Expect.equals("test1 called 1 times, test2() called 0 times", c4?.log);
//                                                                ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR

  var actual17 = c4 ?.. test2();
//                  ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR

  Expect.equals(expected4, actual17);
  Expect.equals("test1 called 1 times, test2() called 1 times", c4?.log);
//                                                                ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR

  var actual18 = c4
      ?.. test1
//    ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  .. test2();
  Expect.equals(expected4, actual18);
  Expect.equals("test1 called 2 times, test2() called 2 times", c4?.log);
//                                                                ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
}
