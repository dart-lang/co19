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
/// @description Checks that
/// `CONST_CANONICAL_TYPE(R Function<X extends B>(S)) = F*`
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-strong

import "const_evaluation_lib.dart";

typedef FUNC = int Function<X extends String>(double);

int testme<X extends String>(double d) => throw "Should not reach here";

main() {
  const c1 = C<FUNC>(null);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}
