// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion CONST_CANONICAL_TYPE(R Function<X extends B>(S)) = F*
///   where F = R1 Function<X extends B1>(S1)
///   and R1 = CONST_CANONICAL_TYPE(R)
///   and B1 = CONST_CANONICAL_TYPE(B)
///   and S1 = CONST_CANONICAL_TYPE(S)
/// Note, this generalizes to arbitrary number of type and term parameters.
///
/// @description Checks that CONST_CANONICAL_TYPE(R Function<X extends B>(S)) in
/// the weak mode.
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

typedef FUNC = int Function<X extends String>(double);
int testme<X extends String>(double d) => throw "Should not reach here";

main() {
  const c1 = C<FUNC>(null);
}
