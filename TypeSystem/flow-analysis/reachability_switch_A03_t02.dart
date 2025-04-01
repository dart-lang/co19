// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion switch statement: If `N` is a switch statement of the form
/// `switch (E) {alternatives}` then:
/// - Let `before(E) = before(N)`.
/// - For each `C` in `alternatives` with statement body `S`:
///   - If `C` is labelled let
///     `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`
///     otherwise let `before(S) = after(E)`.
///  - If the cases are exhaustive, then let `after(N) = break(N)` otherwise let
///    `after(N) = join(after(E), break(N))`.
///
/// @description Checks that if `C` is not labelled then `before(S) = after(E)`.
/// Test that if `C` is not labeled and a variable was assigned in `N` then  it
/// is definitely assigned in the same `S` but definitely unassigned in all
/// others.
/// @author sgrekhov22@gmail.com

void test1() {
  late int i;
  switch (42) {
    case 1:
      i = 42;
      i; // Ok
    case 2:
      i; // Definitely unassigned
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    default:
      i;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

void test2() {
  late int i;
  switch (42) {
    label: case 1:
      i = 42;
      i; // Ok
    case 2:
      i;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    default:
      i;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

void test3() {
  late int i;
  switch (42) {
    case 1:
      i;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    default:
      i = 42;
      i;
  }
}

main() {
  print(test1);
  print(test2);
  print(test3);
}
