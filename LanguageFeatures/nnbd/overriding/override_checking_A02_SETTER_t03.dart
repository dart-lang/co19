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
 * setter can have non-nullable argument.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "dart:async";
import "override_checking_A02_opted_out_lib.dart";
import "../../../Utils/expect.dart";

void testme() {}

class A extends LEGACY_SETTER {
  void set setInt(int? i)                             { Expect.equals(1, i);      }
  void set setObject(Object? o)                       { Expect.equals(1, o);      }
  void set setFunction(Function? f)                   { Expect.equals(testme, f); }
  void set setFutureOrInt(FutureOr<int>? f)           { Expect.equals(1, f);      }
  void set setFutureOrFunction(FutureOr<Function>? f) { Expect.equals(testme, f); }
}

main() {
  A a = A();

  a.setInt = 1;
  a.setObject = 1;
  a.setFunction = testme;
  a.setFutureOrInt = 1;
  a.setFutureOrFunction = testme;
}
