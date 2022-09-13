// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion From the Unified collection Spec:
/// A spreadElement starting with [...] is a constant element if its expression
/// is constant and it evaluates to a constant List, Set or Map instance
/// originally created by a list, set or map literal. It is a potentially
/// constant element if the expression is a potentially constant expression.
/// @description: Checks that constant list spread element cannot be
/// non-constant, cannot be [null] and cannot be of the type which is not [List]
/// or [Set]
/// @author iarkh@unipro.ru


List l = [];
Set s = {};

const m1 = {1: 1};
Map m2 = {2: 2};

const int i1 = 25;
int i2 = 25;

const n = null;

main() {
  const List res1  = const [...l];
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
  const List res2  = const [...s];
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
  const List res3  = const [...m1];
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified
  const List res4  = const [...m2];
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified
  const List res5  = const [...i1];
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified
  const List res6  = const [...i2];
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified
  const List res7  = const [...n];
//                   ^
// [cfe] Constant evaluation error:
//                             ^
// [analyzer] COMPILE_TIME_ERROR.CONST_SPREAD_EXPECTED_LIST_OR_SET
}
