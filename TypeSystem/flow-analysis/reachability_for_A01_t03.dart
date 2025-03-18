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
/// that `assignedIn(D)` is detected by flow analysis.
/// @author sgrekhov22@gmail.com

test1() {
  int n;
  for (n = 42; n > 0;) { // n definitely assigned
    break;
  }
}

test2() {
  int n;
  [
    for (n = 42; n < 0;)  // n definitely assigned
      0
  ];
}

test3() {
  int n;
  <int, int>{
    for (n = 42; n < 0;) // n definitely assigned
      0: 0
  };
}

main() {
  print(test1);
  print(test2);
  print(test3);
}
