/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collection Spec:
 * A spreadElement starting with [...] is a constant element if its expression
 * is constant and it evaluates to a constant List, Set or Map instance
 * originally created by a list, set or map literal. It is a potentially
 * constant element if the expression is a potentially constant expression.
 * @description: Checks that constant set spread element cannot be [Map], [int]
 * or [null].
 * @author iarkh@unipro.ru
 */

main() {
  const Set res1 = const {...{1: 2, 3: 4}};
// [error line 18, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Set res2 = const {...44};
// [error line 22, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Set res3 = const {...null};
// [error line 26, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Set res4 = const {..."abcde"};
// [error line 30, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}
