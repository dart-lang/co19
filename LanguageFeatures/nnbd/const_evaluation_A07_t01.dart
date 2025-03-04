// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion CONST_CANONICAL_TYPE(X extends T) = X*
///
/// @description Checks that `CONST_CANONICAL_TYPE(X extends T) = X*`
/// @author iarkh@unipro.ru

import "const_evaluation_lib.dart";

class D<T> extends C<T> {
  const D(Object? o) : super(o);
}

const dynamic d = null;

main() {
  const d1 = D<int>(null);
//           ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const d2 = D<int>(d);
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
