// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion CONST_CANONICAL_TYPE(T) = T* if T is Never or Object
///
/// @description Checks that `CONST_CANONICAL_TYPE(Never) = Never*`
/// @Issue 45067
/// @author iarkh@unipro.ru

// Requirements=nnbd-strong

import "const_evaluation_lib.dart";

main() {
  const c = C<Never>(null);
//          ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
