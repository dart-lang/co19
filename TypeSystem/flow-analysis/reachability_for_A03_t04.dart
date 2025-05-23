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
/// @description Checks that `before(U) = merge(after(S), continue(S))`. Test
/// that if `S` throws, then an assignment in `U` will never happen.
/// @author sgrekhov22@gmail.com

Never foo() => throw "Never";

test1() {
  late int i;
  if (2 > 1) {
    for (;; i = 42) {
      foo();
    }
  }
  i; // Definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test2() {
  late int i;
  if (2 > 1) {
    [
      for (;; i = 42) foo()
    ];
  }
  i; // Definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test3() {
  late int i;
  if (2 > 1) {
    <int, int>{
      for (;; i = 42)
        0: foo()
    };
  }
  i; // Definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test4() {
  late int i;
  if (2 > 1) {
    <int, int>{
      for (;; i = 42)
        foo(): 0
    };
  }
  i; // Definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
}
