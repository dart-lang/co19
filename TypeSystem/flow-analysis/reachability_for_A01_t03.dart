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
/// that if variable is assigned `after(D)` then it is definitely assigned
/// `before(C)`.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

test1() {
  int n;
  for (n = 42; n > 0;) { // n definitely assigned
    break;
  }
}

test2() {
  int n;
  [
    for (n = 42; n < 0;)
      0
  ];
}

test3() {
  int n;
  <int, int>{
    for (n = 42; n < 0;)
      0: 0
  };
}

test4() {
  int n;
  for ((n,) = (42,); n > 0;) {
    break;
  }
}

test5() {
  int n;
  for ((x: n) = (x: 42); n > 0;) {
    break;
  }
}

test6() {
  int n;
  for (C(v: n) = C(42); n > 0;) {
    break;
  }
}

test7() {
  int n;
  [
    for ((n,) = (42,); n < 0;)
      0
  ];
}

test8() {
  int n;
  [
    for ((x: n) = (x: 42); n < 0;)
      0
  ];
}

test9() {
  int n;
  [
    for (C(v: n) = C(42); n < 0;)
      0
  ];
}

test10() {
  int n;
  <int, int>{
    for ((n,) = (42,); n < 0;)
      0: 0
  };
}

test11() {
  int n;
  <int, int>{
    for ((x: n) = (x: 42); n < 0;)
      0: 0
  };
}

test12() {
  int n;
  <int, int>{
    for (C(v: n) = C(42); n < 0;)
      0: 0
  };
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
