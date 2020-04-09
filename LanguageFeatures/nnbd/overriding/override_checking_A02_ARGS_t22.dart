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
 * @description Check that if opted-in class implements legacy class, compile
 * time error is thrown if parent legacy method parameter is of any legacy type
 * and child opted-in method parameter is [Never].
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "override_checking_A02_opted_out_lib.dart";

class A implements LEGACY_ARGS {
  void test_int(Never i) {}
//     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void test_object(Never o) {}
//     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void test_dynamic(Never i) {}
//     ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void test_function(Never f) {}
//     ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void test_null(Never n) {}
//     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void test_futureOr(Never i) {}
//     ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}

main() {}
