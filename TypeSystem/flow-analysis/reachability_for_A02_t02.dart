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
/// @description Checks that `before(S) = split(true(C))`. Test that if `C` is a
/// `true` literal then assignment in `S` is a definite assignment.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

test1() {
  int i;
  for (; true;) {
    i = 42;
    break;
  }
  i; // Definitely assigned.
}

test2() {
  int i;
  for (; true;) {
    (i,) = (42,);
    break;
  }
  i; // Definitely assigned.
}

test3() {
  int i;
  for (; true;) {
    (x: i) = (x: 42);
    break;
  }
  i; // Definitely assigned.
}

test4() {
  int i;
  for (; true;) {
    C(v: i) = C(42);
    break;
  }
  i; // Definitely assigned.
}

main() {
  test1();
}
