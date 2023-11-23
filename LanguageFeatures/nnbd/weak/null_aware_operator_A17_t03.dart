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
/// Test legacy pre-NNBD types
/// @author sgrekhov@unipro.ru
/// @issue 40959

// Requirements=nnbd-weak
import "../../../Utils/expect.dart";
import "legacy_lib.dart";

main() {
  A a1 = new A();

  var actual1 = a1 ?.. test();
//                 ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//              ^
// [cfe] Operand of null-aware operation '?..' has type 'A' which excludes null.
  var expected = a1;
  Expect.equals(expected, actual1);
  Expect.equals("test() called 1 times, text2 called 0 times", a1.log);

  var actual2 = a1 ?.. text2;
//                 ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//              ^
// [cfe] Operand of null-aware operation '?..' has type 'A' which excludes null.
  Expect.equals(expected, actual2);
  Expect.equals("test() called 1 times, text2 called 1 times", a1.log);

  var actual3 = a1
//              ^
// [cfe] Operand of null-aware operation '?..' has type 'A' which excludes null.
      ?.. test()
//    ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
      .. text2;
  Expect.equals(expected, actual3);
  Expect.equals("test() called 2 times, text2 called 2 times", a1.log);

  A? a2 = null;
  var actual4 = a2 ?.. test();
  Expect.isNull(actual4);

  var actual5 = a2 ?.. text2;
  Expect.isNull(actual5);

  var actual6 = a2
      ?.. test()
      .. text2;
  Expect.isNull(actual6);

  a2 = new A();
  var actual7 = a2 ?.. test();
//                 ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//              ^
// [cfe] Operand of null-aware operation '?..' has type 'A' which excludes null.
  var expected2 = a2;
  Expect.equals(expected2, actual7);
  Expect.equals("test() called 1 times, text2 called 0 times", a2?.log);
//                                                               ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                                             ^
// [cfe] Operand of null-aware operation '?.' has type 'A' which excludes null.

  var actual8 = a2 ?.. text2;
//                 ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//              ^
// [cfe] Operand of null-aware operation '?..' has type 'A' which excludes null.
  Expect.equals(expected2, actual8);
  Expect.equals("test() called 1 times, text2 called 1 times", a2?.log);
//                                                               ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                                             ^
// [cfe] Operand of null-aware operation '?.' has type 'A' which excludes null.

  var actual9 = a2
//              ^
// [cfe] Operand of null-aware operation '?..' has type 'A' which excludes null.
      ?.. test()
//    ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
      .. text2;
  Expect.equals(expected2, actual9);
  Expect.equals("test() called 2 times, text2 called 2 times", a2?.log);
//                                                               ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                                             ^
// [cfe] Operand of null-aware operation '?.' has type 'A' which excludes null.

}
