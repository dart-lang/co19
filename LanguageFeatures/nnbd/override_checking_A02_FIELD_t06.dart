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
 * @description Check that if opted-in class is a mixin with legacy class,
 * opted-in field of non-nullable type cannot override legacy field, compile
 * time error is thrown in this case.
 *
 * @author iarkh@unipro.ru
*/
// SharedOptions=--enable-experiment=non-nullable

import "dart:async";
import "override_checking_legacy_lib.dart";

class A1 with LEGACY_FIELD {
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
}

class A2 with LEGACY_FIELD {
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
}

void testme() {}

class A3 with LEGACY_FIELD {
  int i = 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  Object o = "";
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  Function func = testme;
//         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<int> fi = 12345;
//              ^^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<Function> ff = testme;
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  A1();
  A2();
  A3();
}
