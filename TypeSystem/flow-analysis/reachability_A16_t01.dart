// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion - Conditional expression: If `N` is a conditional expression of
/// the form `E1 ? E2 : E3`, then:
/// - Let `before(E1) = before(N)`.
/// - Let `before(E2) = split(true(E1))`.
/// - Let before(E3) = split(false(E1))`.
/// - Let `after(N) = merge(after(E2), after(E3))`.
/// - Let `true(N) = merge(true(E2), true(E3))`.
/// - Let `false(N) = merge(false(E2), false(E3))`.
///
/// @description Checks flow analysis after conditional expression.
/// @author sgrekhov22@gmail.com

void test1() {
  late int i;
  int j;
  true ? j = 42 : i = 42;
  j; // Ok, j is definitely assigned
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

void test2() {
  late int i;
  int j;
  false ? i = 42 : j = 42;
  j; // Ok, j is definitely assigned
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test1);
  print(test2);
}
