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
 * @description Check that if generic opted-in class implements generic legacy
 * class with [FutureOr<non_nullable_type>] type parameter, child opted-in class
 * type parameter can extend non-nullable [FutureOr<non_nullable_type>] type.
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

class OptedFutureOrInt<T extends FutureOr<int>> implements LEGACY_CLASS_FUTUREORINT<T> {
 dynamic getParamType() => T;
}

class OptedFutureOrFunction<T extends FutureOr<Function>> implements LEGACY_CLASS_FUTUREORFUNCTION<T> {
 dynamic getParamType() => T;
}

main() {
 Expect.equals(typeOf<FutureOr<int>>(), OptedFutureOrInt().getParamType());
 Expect.equals(typeOf<FutureOr<int>>(), OptedFutureOrInt<FutureOr<int>>().getParamType());

 Expect.equals(typeOf<FutureOr<Function>>(), OptedFutureOrFunction().getParamType());
 Expect.equals(typeOf<FutureOr<Function>>(), OptedFutureOrFunction<FutureOr<Function>>().getParamType());
}
