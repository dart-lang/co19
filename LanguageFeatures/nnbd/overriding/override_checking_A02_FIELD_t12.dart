/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a migrated library, override checking must check that an
 * override is consistent with all overridden methods from other migrated
 * libraries in the super-interface chain, since a legacy library is permitted
 * to override otherwise incompatible signatures for a method.
 *
 * @description Check that if opted-in class implements two classes (one is
 * legacy) with some field, opted-in field of non-nullable type cannot override
 * legacy field, compile time error is thrown in this case.
 *
 *  @Issue 39678
 *
 * @author iarkh@unipro.ru
*/
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "dart:async";
import "override_checking_A02_opted_out_lib.dart";

void testme() {}

abstract class AA {
  int i = -1;
  Object o = 5;
  Function func = testme;
  FutureOr<int> fi = -1;
  FutureOr<Function> ff = testme;
}

class A1 implements LEGACY_FIELD, AA {
  int i;
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  Object o;
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  Function func;
//         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<int> fi;
//              ^^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<Function> ff;
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified

  dynamic d;
  Null n;
  FutureOr f;
  void v;
}

class A2 implements LEGACY_FIELD, AA {
  int i = null;
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  Object o = null;
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  Function func = null;
//         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<int> fi = null;
//              ^^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<Function> ff = null;
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified

  dynamic d = null;
  Null n = null;
  FutureOr f = null;
  void v = null;
}

main() {
  A1();
  A2();
}
