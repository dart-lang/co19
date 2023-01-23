// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In a migrated library, override checking must check that an
/// override is consistent with all overridden methods from other migrated
/// libraries in the super-interface chain, since a legacy library is permitted
/// to override otherwise incompatible signatures for a method.
///
/// @description Check that compiler error is thrown if opted-in class implements
/// legacy class and child migrated method with non-nullable argument overrides
/// legacy method which argument is nullable.
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "dart:async";
import "override_checking_A02_opted_out_lib.dart";
import "../../../../Utils/expect.dart";

class A implements LEGACY_ARGS {
  void test_int(int i)           { Expect.equals(1, i); }
  void test_object(Object i)     { Expect.equals(1, i); }
  void test_function(Function i) { Expect.equals(testme, i); }

  void test_dynamic(dynamic i)   {}
  void test_futureOr(FutureOr i) {}
  void test_null(Null i)         {}
}

void testme() {}

main() {
  A a = A();

  a.test_int(1);
  a.test_object(1);
  a.test_function(testme);
}
