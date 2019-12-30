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
 *  Check that '?..' operator must be the first in the cascade sequence. Test
 * type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong

class C {
  String test1 = "Let it be";
  String test2 = "Show must go on";
  void foo() {}
}

typedef CAlias1 = C?;
typedef CAlias2 = C;

main() {
  CAlias1? c1 = null;
  c1 ?.. test1
    ?.. test2
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
      ?.. foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  CAlias1 c2 = null;
  c2 ?.. test1
     ?.. test2
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified
      ?.. foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  CAlias2? c3 = null;
  c3 ?.. test1
     ?.. test2
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified
      ?.. foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
