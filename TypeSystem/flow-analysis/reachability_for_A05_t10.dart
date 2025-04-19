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
/// @description Checks that if a type `T` is made a type of interest in `U`
/// then some variable can be promoted to `T` in `U` and `after(N)`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  for (int i = 0; i < 1; s is T ? true : false, s = T(), s.answer(), i++) {
  }
}

test2() {
  S s = S();
  [
    for (int i = 0; i < 1; s is T ? true : false, s = T(), s.answer(), i++) 0
  ];
}

test3() {
  S s = S();
  <int>{
    for (int i = 0; i < 1; s is T ? true : false, s = T(), s.answer(), i++) 0
  };
}

test4() {
  S s = S();
  <int, int>{
    for (int i = 0; i < 1; s is T ? true : false, s = T(), s.answer(), i++) 0: 0
  };
}

test5() {
  S s = S();
  for (int i = 0; i < 1; s is T ? true : false, i++) {
  }
  s = T();
  s.answer();
}

test6() {
  S s = S();
  [
    for (int i = 0; i < 1; s is T ? true : false, i++) 0
  ];
  s = T();
  s.answer();
}

test7() {
  S s = S();
  <int>{
    for (int i = 0; i < 1; s is T ? true : false, i++) 0
  };
  s = T();
  s.answer();
}

test8() {
  S s = S();
  <int, int>{
    for (int i = 0; i < 1; s is T ? true : false, i++) 0: 0
  };
  s = T();
  s.answer();
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
}
