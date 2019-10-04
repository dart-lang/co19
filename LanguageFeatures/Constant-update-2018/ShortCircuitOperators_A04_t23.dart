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
 * throws a compile error if some operand is of incorrect type.
 * @author iarkh@unipro.ru
 */

const String s = "constant string";
const dynamic d = "another string";

main() {

  const int i1 = true ? s : 1;
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

  const int i2 = true ? d : 1;
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

  const int i3 = true ? 0 : s;

  const int i4 = true ? 10 : d;

  const int i5 = false ? s : 1;

  const int i6 = false ? d : 1;

  const int i7 = false ? 0 : s;
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

  const int i8 = false ? 10 : d;
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

}
