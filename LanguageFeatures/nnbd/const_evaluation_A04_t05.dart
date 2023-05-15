// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion CONST_CANONICAL_TYPE(FutureOr<T>) = FutureOr<S>* where S is
/// CONST_CANONICAL_TYPE(T)
///
/// @description Checks that
/// `CONST_CANONICAL_TYPE(FutureOr<Null>) = FutureOr<Null>`
///
/// @author iarkh@unipro.ru

import"dart:async";
import "const_evaluation_lib.dart";

const dynamic d = null;
Never n = throw "Should not reach here";

main() {
  const c1 = C<FutureOr<Null>>(1);
//           ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
