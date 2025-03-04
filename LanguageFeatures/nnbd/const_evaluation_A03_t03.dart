// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion CONST_CANONICAL_TYPE(T) = T* if T is Never or Object
///
/// @description Checks that `CONST_CANONICAL_TYPE(Object) = Object*`
/// @Issue 45067
/// @author iarkh@unipro.ru

import "const_evaluation_lib.dart";

const dynamic d = null;
Never n = throw "Should not reach here";

main() {
  const c1 = C<Object>(null);
//           ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c2 = C<Object>(d);
//           ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
