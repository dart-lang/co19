// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion CONST_CANONICAL_TYPE(C<T0, ..., Tn>) = C<R0, ..., Rn>*
///  where Ri is CONST_CANONICAL_TYPE(Ti)
///  Note this includes the case of an interface type with no generic parameters
///  (e.g int).
///
/// @description Checks that
/// `CONST_CANONICAL_TYPE(C<T0, ..., Tn>) = C<R0, ..., Rn>*`
///
/// @author iarkh@unipro.ru

import "const_evaluation_lib.dart";

class N<X, Y, Z> { const N(); }

main() {
  const c = C<List<int>>(null);
//          ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c1 = C<N<int, String, Never>>(null);
//           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
