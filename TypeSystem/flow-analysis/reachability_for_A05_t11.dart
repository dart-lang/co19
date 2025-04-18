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
/// @description Checks that if a type `T` is made a type of interest in `S`
/// then some variable can be promoted to `T` in `U`, `S` and `after(N)`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  for (; 1 > 2; s = T(), s.answer()) {
    if (s is T) {} // Make T a type of interest
  }
}

test2() {
  S s = S();
  [
    for (; 1 > 2; s = T(), s.answer())
      if (s is T) 0,
  ];
  s = T();
  s.answer();
}

test3() {
  S s = S();
  <int>{
    for (; 1 > 2; s = T(), s.answer())
      if (s is T) 0
  };
  s = T();
  s.answer();
}

test4() {
  S s = S();
  <int, int>{
    for (; 1 > 2; s = T(), s.answer())
      if (s is T) 0: 0
  };
  s = T();
  s.answer();
}

test5() {
  S s = S();
  for (; 1 > 2;) {
    if (s is T) {}
  }
  s = T();
  s.answer();
}

test6() {
  S s = S();
  [
    for (; 1 > 2;)
      if (s is T) 0,
  ];
  s = T();
  s.answer();
}

test7() {
  S s = S();
  <int>{
    for (; 1 > 2;)
      if (s is T) 0
  };
  s = T();
  s.answer();
}

test8() {
  S s = S();
  <int, int>{
    for (; 1 > 2;)
      if (s is T) 0: 0
  };
  s = T();
  s.answer();
}

test9() {
  S s = S();
  for (; 1 > 2;) {
    if (s is T) {}
    s = T();
    s.answer();
  }
}

test10() {
  S s = S();
  [
    for (; 1 > 2;) [s is T ? 1 : 2, s = T(), s.answer()]
  ];
}

test11() {
  S s = S();
  <List<Object>>{
    for (; 1 > 2;) [s is T ? 1 : 2, s = T(), s.answer()]
  };
}

test12() {
  S s = S();
  <int, List<Object>>{
    for (; 1 > 2;) s is T ? 1 : 2: [s = T(), s.answer()]
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
