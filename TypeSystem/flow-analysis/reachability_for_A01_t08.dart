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
/// that an assignment in `S` doesn't affect value of `before(D)`.
/// @author sgrekhov22@gmail.com

test1() {
  late int n;
  for (n;;) { // Definitely unassigned
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    n = 42;
    break;
  }
}

test2() {
  int n;
  [
    for (n; ;) n = 42
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  ];
}

test3() {
  int n;
  <int, int>{
    for (n; ;) n = 42: 0
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

test4() {
  int n;
  <int, int>{
    for (n; ;) 0: n = 42
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
}
