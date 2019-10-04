/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Finally, the conditional [?]/[:] operator only evaluates one of
 * its branches, depending on whether the condition expression evaluates to
 * [true] or [false]. The other branch must also be a potentially constant
 * expression.
 * @description Checks that conditional operator [?]/[:] in constant expression
 * throws a compile error if condition is of incorrect type.
 * @author iarkh@unipro.ru
 */

const s = "wrong condition";
const dynamic b = true;
const dynamic d = "wrong dynamic";
const dynamic nil = null;

main() {
  const res1 = s ? "yes" : "no";
//             ^
// [analyzer] unspecified
// [cfe] unspecified

  const res2 = b ? "yes" : "no";

  const res3 = d ? "yes" : "no";
//             ^
// [analyzer] unspecified
// [cfe] unspecified

  const res4 = null ? "yes" : "no";
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const res5 = nil ? "yes" : "no";
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified

  const res6 = 114 ? "yes" : "no";
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified

}
