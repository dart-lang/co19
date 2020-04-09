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
 * @description Check that if generic opted-in class is a mixin with generic
 * legacy class with [FutureOr] type parameter, child opted-in class type
 * parameter can extend [Null].
 *
 * @Issue 39666
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "dart:async";
import "../../../Utils/expect.dart";
import "override_checking_A02_opted_out_futureor_lib.dart";

class OptedFutureOr<T extends Null> extends LEGACY_CLASS_FUTUREOR<T> {
  dynamic getParamType() => T;
}

class OptedFutureOrInt<T extends Null> extends LEGACY_CLASS_FUTUREORINT<T> {
  dynamic getParamType() => T;
}

class OptedFutureOrFunction<T extends Null> extends LEGACY_CLASS_FUTUREORFUNCTION<T> {
  dynamic getParamType() => T;
}

class OptedFutureOrFutureOr<T extends Null> extends LEGACY_CLASS_FUTUREORFUTUREOR<T> {
  dynamic getParamType() => T;
}

main() {
  Expect.equals(typeOf<Null>(), OptedFutureOr().getParamType());
  Expect.equals(typeOf<Null>(), OptedFutureOr<Null>().getParamType());

  Expect.equals(typeOf<Null>(), OptedFutureOrInt().getParamType());
  Expect.equals(typeOf<Null>(), OptedFutureOrInt<Null>().getParamType());

  Expect.equals(typeOf<Null>(), OptedFutureOrFunction().getParamType());
  Expect.equals(typeOf<Null>(), OptedFutureOrFunction<Null>().getParamType());

  Expect.equals(typeOf<Null>(), OptedFutureOrFutureOr().getParamType());
  Expect.equals(typeOf<Null>(), OptedFutureOrFutureOr<Null>().getParamType());
}
