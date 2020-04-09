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
 * @description Check that if opted-in class implements two classes with some
 * method (the first class is legacy and method in the second has argument of
 * nullable type), opted-in method argument can be of nullable type and the
 * method can accept null argument of [FutureOr].
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "dart:async";
import "../../../Utils/expect.dart";
import "override_checking_A02_opted_out_lib.dart";

abstract class B {
  void test_futureOr(FutureOr i);
}

class A implements B, LEGACY_ARGS {

  void test_futureOr(FutureOr? i) { Expect.isNull(i); }

  void test_int(int? i)           {}
  void test_object(Object? i)     {}
  void test_dynamic(dynamic i)    {}
  void test_function(Function? i) {}
  void test_null(Null i)          {}
}

main() {
  A a = A();
  a.test_futureOr(null);
}
