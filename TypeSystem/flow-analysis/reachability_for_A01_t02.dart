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
/// that if the static type of `D` is other than `Never` then an assignment in
/// `C` is a definite assignment.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

test1() {
  int i;
  for (; (i = 42) < 0;) {}
  i; // Definitely assigned.
}

test2() {
  int i;
  [
    for (; (i = 42) < 0;) 0
  ];
  i;
}

test3() {
  int i;
  <int, int>{
    for (; (i = 42) < 0;) 0: 0
  };
  i;
}

test4() {
  int i;
  for (; ((i,) = (42,)) == 0;) {}
  i;
}

test5() {
  int i;
  for (; ((x: i) = (x: 42)) == 0;) {}
  i;
}

test6() {
  int i;
  for (; (C(v: i) = C(42)) == 0;) {}
  i;
}

test7() {
  int i;
  [
    for (; ((i,) = (42,)) == 0;) 0
  ];
  i;
}

test8() {
  int i;
  [
    for (; ((x: i) = (x: 42)) == 0;) 0
  ];
  i;
}

test9() {
  int i;
  [
    for (; (C(v: i) = C(42)) == 0;) 0
  ];
  i;
}

test10() {
  int i;
  <int, int>{
    for (; ((i,) = (42,)) == 0;) 0: 0
  };
  i;
}

test11() {
  int i;
  <int, int>{
    for (; ((x: i) = (x: 42)) == 0;) 0: 0
  };
  i;
}

test12() {
  int i;
  <int, int>{
    for (; (C(v: i) = C(42)) == 0;) 0: 0
  };
  i;
}

main() {
  test1();
  test2();
  test3();
  test4();
  test5();
  test6();
  test7();
  test8();
  test9();
  test10();
  test11();
  test12();
}
