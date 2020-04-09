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
 * field of non-nullable type can override legacy field.
 *
 * @author iarkh@unipro.ru
*/
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "dart:async";
import "override_checking_A02_opted_out_lib.dart";
import "../../../Utils/expect.dart";

void testme() {}

class A extends LEGACY_FIELD {
  int i = 1;
  Object o = "";
  Function func = testme;
  FutureOr<int> fi = 12345;
  FutureOr<Function> ff = testme;
}

main() {
  A a = A();
  Expect.equals(1, a.i);
  Expect.equals("", a.o);
  Expect.equals(testme, a.func);
  Expect.equals(12345, a.fi);
  Expect.equals(testme, a.ff);
}
