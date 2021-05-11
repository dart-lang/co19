// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion CONST_CANONICAL_TYPE(C<T0, ..., Tn>) = C<R0, ..., Rn>*
///   where Ri is CONST_CANONICAL_TYPE(Ti)
///   Note this includes the case of an interface type with no generic parameters
///   (e.g int).
///
/// @description Checks that CONST_CANONICAL_TYPE(C<T0, ..., Tn>) in the weak
/// mode.
/// Please note that this test should not be executed with analyzer.
/// The exception is that some constant expressions are evaluated at compile time
/// (we don't actually promise that they are evaluated before run time, but we
/// know that some compile-time evaluation does take place); some of those
/// constant expressions have different semantics in an execution with sound and
/// unsound null checking. Hence we may be able to observe a different behavior.
/// The analyzer assumes sound null checking during constant evaluation. So, the
/// test should be skipped by analyzer.
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "../../const_evaluation_lib.dart";

class N<X, Y, Z> { const N(); }

main() {
  const c = C<List<int>>(null);
  const c1 = C<N<int, String, Never>>(null);
}
