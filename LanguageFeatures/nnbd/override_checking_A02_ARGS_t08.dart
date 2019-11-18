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
 * @description Check that compiler error is thrown if opted-in class implements
 * legacy class and child migrated method with non-nullable argument overrides
 * legacy method which argument is is nullable.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "dart:async";
import "override_checking_legacy_lib.dart";

class A implements LEGACY_ARGS {
  void test_int(int i) {}
//     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void test_object(Object i) {}
//     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void test_function(Function i) {}
//     ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void test_dynamic(dynamic i) {}
  void test_futureOr(FutureOr i) {}
  void test_null(Null i) {}
}

main() {}
