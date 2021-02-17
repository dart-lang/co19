/*
 * Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion CONST_CANONICAL_TYPE(T*) = CONST_CANONICAL_TYPE(T)
 *
 * @description Checks that CONST_CANONICAL_TYPE(int) = int
 *
 * @author iarkh@unipro.ru
 */

import "const_evaluation_lib.dart";

const dynamic d = null;
Never n = throw "Should not reach here";

const c1 = C<int>(null);
//         ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

const c2 = C<int>(d);
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {}
