// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion CONST_CANONICAL_TYPE(T*) = CONST_CANONICAL_TYPE(T)
///
/// @description Checks that CONST_CANONICAL_TYPE(int*) = int
/// @Issue 45067
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import '../const_evaluation_lib.dart';
import 'const_evaluation_legacy_lib.dart';

const dynamic d = null;

main() {
  const c1 = C.t(null, cLegacyInt);
//           ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c2 = C.t(d, cLegacyInt);
//           ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
