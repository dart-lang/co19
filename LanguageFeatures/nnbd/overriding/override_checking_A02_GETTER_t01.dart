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
 * getter of nullable type can override legacy getter which returns non-null
 * value.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "dart:async";
import "../../../Utils/expect.dart";
import "override_checking_A02_opted_out_lib.dart";

void testme() {}

class A extends LEGACY_GETTER {
  int? get getInt => 1;
  Object? get getObject => 1;
  dynamic? get getDynamic => 1;
  Function? get getFunction => testme;
  Null? get getNull => null;
  FutureOr? get getFutureOr => 1;
  FutureOr<int>? get getFutureOrInt => 1;
  FutureOr<Function>? get getFutureOrFunction => testme;
}

main() {
  A a = A();
  Expect.equals(1, a.getInt);
  Expect.equals(1, a.getObject);
  Expect.equals(1, a.getDynamic);
  Expect.equals(testme, a.getFunction);
  Expect.isNull(a.getNull);
  Expect.equals(1, a.getFutureOr);
  Expect.equals(1, a.getFutureOrInt);
  Expect.equals(testme, a.getFutureOrFunction);
}
