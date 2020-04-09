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
 * @description Check that if opted-in class extends legacy class, child
 * opted-in method argument can be of nullable type and the method can accept
 * non-null arguments.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "dart:async";
import "../../../Utils/expect.dart";
import "override_checking_A02_opted_out_lib.dart";

void test() {}

class A extends LEGACY_ARGS {
  void test_int(int? i)           { Expect.equals(1, i); }
  void test_object(Object? i)     { Expect.equals(1, i); }
  void test_dynamic(dynamic i)    { Expect.equals(1, i); }
  void test_function(Function? i) { Expect.equals(test, i); }
  void test_futureOr(FutureOr? i) { Expect.equals(1, i); }
}

main() {
  A a = A();
  a.test_int(1);
  a.test_object(1);
  a.test_dynamic(1);
  a.test_function(test);
  a.test_futureOr(1);
}
