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
 * @description Check that if opted-in class extends legacy class, opted-in
 * setter cannot have non-nullable argument and compile error is thrown in this
 * case.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "dart:async";
import "override_checking_legacy_lib.dart";

class A extends LEGACY_SETTER {
  void set setInt(int i) {}
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified


  void set setObject(Object o) {}
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set setFunction(Function f) {}
//         ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set setFutureOrInt(FutureOr<int> f) {}
//         ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set setFutureOrFunction(FutureOr<Function> f) {}
//         ^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set setDynamic(dynamic d) {}
  void set setNull(Null n) {}
  void set setFutureOr(FutureOr f) {}
}

main() {
  A();
}
