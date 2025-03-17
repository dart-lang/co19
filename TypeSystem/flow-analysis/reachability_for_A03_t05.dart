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
/// that if the static type of `D` is `Never`, then an assignment in `U` will
/// never happen.
/// @author sgrekhov22@gmail.com
/// @issue 60320

test1() {
  int i;
  for (;; i = 42) {
  }
  i; // Dead code but definitely assigned.
}

test2() {
  int i;
  [
    for (;; i = 42) 0
  ];
  i; // Dead code but definitely assigned.
}

test3() {
  int i;
  <int, int>{
    for (;; i = 42)
      0: 0
  };
  i; // Dead code but definitely assigned.
}

main() {
  print(test1);
  print(test2);
  print(test3);
}
