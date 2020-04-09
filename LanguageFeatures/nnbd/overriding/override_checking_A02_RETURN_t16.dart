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
 * legacy), child migrated method can have [Never] return value.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "dart:async";
import "override_checking_A02_opted_out_lib.dart";
import "../../../Utils/expect.dart";

abstract class AA {
  int? getInt();
  Object? getObject();
  dynamic getDynamic();
  Function? getFunction();
  Null getNull();
  FutureOr getFutureOr();
  FutureOr<int>? getFutureOrInt();
  FutureOr<Function>? getFutureOrFunction();
}

class A implements AA, LEGACY_RETURN {
  Never getInt()              => throw "It's impossible!";
  Never getObject()           => throw "It's impossible!";
  Never getDynamic()          => throw "It's impossible!";
  Never getFunction()         => throw "It's impossible!";
  Never getNull()             => throw "It's impossible!";
  Never getFutureOr()         => throw "It's impossible!";
  Never getFutureOrInt()      => throw "It's impossible!";
  Never getFutureOrFunction() => throw "It's impossible!";
}

main() {
  A a = A();

  Expect.throws(() { a.getInt(); });
  Expect.throws(() { a.getObject(); });
  Expect.throws(() { a.getDynamic(); });
  Expect.throws(() { a.getFunction(); });
  Expect.throws(() { a.getNull(); });
  Expect.throws(() { a.getFutureOr(); });
  Expect.throws(() { a.getFutureOrInt(); });
  Expect.throws(() { a.getFutureOrFunction(); });
}
