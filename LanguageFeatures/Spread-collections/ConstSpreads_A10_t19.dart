/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collection Spec:
 * A [spreadElement] starting with [...?] is a constant element if its
 * expression is constant and it evaluates to [null] or a constant [List], [Set]
 * or [Map] instance originally created by a list, set or map literal. It is a
 * potentially constant element if the expression is potentially constant
 * expression.
 * @description: Checks that constant map spread [...?] element can only be a
 * constant map or null.
 * @author iarkh@unipro.ru
 */

main() {
  const Map res1 = const {...?{1, 3}};
// [error line 19, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map res2 = const {...?[]};
// [error line 23, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map res3 = const {...?44};
// [error line 27, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  const Map res4 = const {...?<int>{}};
// [error line 31, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}
