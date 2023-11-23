// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion From the Unified collection Spec:
/// A spreadElement starting with [...] is a constant element if its expression
/// is constant and it evaluates to a constant List, Set or Map instance
/// originally created by a list, set or map literal. It is a potentially
/// constant element if the expression is a potentially constant expression.
/// @description: Checks that constant map spread element can be [List], [Set],
/// [int] or [null].
/// @author iarkh@unipro.ru


main() {
  const Map res1 = const {...{1, 3}};
//                 ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const Map res2 = const {...[]};
//                 ^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
  const Map res3 = const {...44};
//                           ^^
// [analyzer] unspecified
// [cfe] unspecified
  const Map res4 = const {...<int>{}};
//                 ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const Map res5 = const {...null};
//                           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
