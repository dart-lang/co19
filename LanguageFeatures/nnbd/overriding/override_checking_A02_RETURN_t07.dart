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
 * @description Check that if opted-in class is a mixin with legacy class, child
 * opted-in method can return non-null value of the nullable type.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "dart:async";
import "../../../Utils/expect.dart";
import "override_checking_A02_opted_out_lib.dart";

void testme() {}

class A with LEGACY_RETURN {
  int? getInt() => 1;
  Object? getObject() => 1;
  dynamic? getDynamic() => 1;
  Function? getFunction() => testme;
  Null? getNull() => null;
  FutureOr? getFutureOr() => 1;
  FutureOr<int>? getFutureOrInt() => 1;
  FutureOr<Function>? getFutureOrFunction() => testme;
}

main() {
  A a = A();
  Expect.equals(1, a.getInt());
  Expect.equals(1, a.getObject());
  Expect.equals(1, a.getDynamic());
  Expect.equals(testme, a.getFunction());
  Expect.isNull(a.getNull());
  Expect.equals(1, a.getFutureOr());
  Expect.equals(1, a.getFutureOrInt());
  Expect.equals(testme, a.getFutureOrFunction());
}
