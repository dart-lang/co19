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
/// @description Checks that if `C` is labelled then
/// `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`. Test
/// that if `C` is labeled and a promoted variable was captured in `N` then  it
/// is demoted in `S`.
/// @author sgrekhov22@gmail.com

void test1(int? n) {
  if (n != null) {  // n promoted to int
    switch (42) {
      case 1:
        () {n = 42;}; // n demoted to int?
      label: case 2:
        n.isEven;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
  }
}

void test2(int? n) {
  if (n != null) {
    switch (42) {
      label: case 1:
        n.isEven;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      case 2:
        () {n = 42;};
      default:
    }
  }
}

void test3(int? n) {
  if (n != null) {
    switch (42) {
      label: case 1:
        n.isEven;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
        () {n = 42;};
    }
  }
}

main() {
  print(test1);
  print(test2);
  print(test3);
}
