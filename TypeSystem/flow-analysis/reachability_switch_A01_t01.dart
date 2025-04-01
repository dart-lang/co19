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
/// @description Checks that if `E` has type `Never` then all `alternatives` are
/// unreachable.
/// @author sgrekhov22@gmail.com

Never foo() => throw "Never";

void test1() {
  late int i;
  if (2 > 1) {
    switch (foo()) {
      case 1:
        i = 42;
      default:
        i = 42;
    }
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

void test2(Never n) {
  late int i;
  if (2 > 1) {
    switch (n) {
      case 1:
        i = 42;
      default:
        i = 42;
    }
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

void test3<T extends Never>(T n) {
  late int i;
  if (2 > 1) {
    switch (n) {
      case 1:
        i = 42;
      default:
        i = 42;
    }
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test1);
  print(test2);
  print(test3);
}
