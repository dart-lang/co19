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
 * @description Check that if opted-in class implements two classes (one is
 * legacy), child opted-in method can return [null].
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "dart:async";
import "../../../Utils/expect.dart";
import "override_checking_A02_opted_out_lib.dart";

abstract class AA {
  int? getInt();
  Object? getObject();
  dynamic? getDynamic();
  Function? getFunction();
  Null? getNull();
  FutureOr? getFutureOr();
  FutureOr<int>? getFutureOrInt();
  FutureOr<Function>? getFutureOrFunction();
}

class A implements LEGACY_RETURN, AA {
  int? getInt() => null;
  Object? getObject() => null;
  dynamic getDynamic() => null;
  Function? getFunction() => null;
  Null getNull() => null;
  FutureOr getFutureOr() => null;
  FutureOr<int>? getFutureOrInt() => null;
  FutureOr<Function>? getFutureOrFunction() => null;
}

main() {
  A a = A();

  Expect.isNull(a.getInt());
  Expect.isNull(a.getObject());
  Expect.isNull(a.getDynamic());
  Expect.isNull(a.getFunction());
  Expect.isNull(a.getNull());
  Expect.isNull(a.getFutureOr());
  Expect.isNull(a.getFutureOrInt());
  Expect.isNull(a.getFutureOrFunction());
}
