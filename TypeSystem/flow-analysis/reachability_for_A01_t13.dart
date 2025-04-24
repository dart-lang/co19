// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion for statement: If `N` is a for statement of the form
/// `for (D; C; U) S,` then:
/// - Let `before(D) = before(N)`.
/// - Let `before(C) = conservativeJoin(after(D), assignedIn(N), capturedIn(N))`
/// - Let `before(S) = split(true(C))`.
/// - Let `before(U) = merge(after(S), continue(S))`.
/// - Let `after(N) = inheritTested(join(false(C), unsplit(break(S))), after(U))`
///
/// @description Checks that
/// `before(C) = conservativeJoin(after(D), assignedIn(N), capturedIn(N))`. Test
/// that an assignment in `S` after `return` is unreachable.
/// @author sgrekhov22@gmail.com

test1() {
  late int i;
  if (2 < 1) {
    for (;;) {
      return;
      i = 42;
    }
    i; // Ok. `after(N)` is unreachable
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test2() {
  late int i;
  if (2 < 1) {
    for (int j = 0; j < 1;) {
      return;
      i = 42;
    }
    i; // Ok. `after(N)` is unreachable
  }
  i; // Possibly assigned
}

main() {
  print(test1);
  print(test2);
}
