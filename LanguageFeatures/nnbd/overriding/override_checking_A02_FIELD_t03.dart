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
 * @description Check that if opted-in class implements legacy class, opted-in
 * field of nullable type can override legacy field.
 *
 * @author iarkh@unipro.ru
*/
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "dart:async";
import "../../../Utils/expect.dart";
import "override_checking_A02_opted_out_lib.dart";

class A implements LEGACY_FIELD {
  int? i;
  Object? o;
  dynamic d;
  Function? func;
  Null n;
  FutureOr? f;
  FutureOr<int>? fi;
  FutureOr<Function>? ff;
  void v;
}

main() {
  A a = A();
  Expect.isNull(a.i);
  Expect.isNull(a.d);
  Expect.isNull(a.o);
  Expect.isNull(a.func);
  Expect.isNull(a.n);
  Expect.isNull(a.f);
  Expect.isNull(a.fi);
  Expect.isNull(a.ff);
}
