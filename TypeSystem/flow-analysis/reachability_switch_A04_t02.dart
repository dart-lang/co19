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
/// @description Checks that if the cases are exhaustive, then
/// `after(N) = break(N)`. Test that if a variable is assigned after `break` in
/// non-labeled case statement then it is definitely unassigned.
/// @author sgrekhov22@gmail.com

void test1() {
  late int i;
  switch (42) {
    case 1:
      break;
      i = 42;
    default:
  }
  i; // Definitely assigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

void test2() {
  late int i;
  switch (42) {
    case 1:
    default:
      break;
      i = 42;
  }
  i; // Definitely assigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test1);
  print(test2);
}
