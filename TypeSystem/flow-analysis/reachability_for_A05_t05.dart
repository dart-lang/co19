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
/// @description Checks that if a type `T` is made a type of interest in `D`
/// then some variable can be promoted to `T` in `C`, `U`, `S` and `after(N)`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  for (s is T ? 1 : 2; [s = T(), s.answer()] == [];) {
  }
}

test2() {
  S s = S();
  for (s is T ? 1 : 2; 1 > 2; s = T(), s.answer()) {
  }
}

test3() {
  S s = S();
  for (s is T ? 1 : 2;;) {
    s = T();
    s.answer();
    break;
  }
}

test4() {
  S s = S();
  for (s is T ? 1 : 2;;) {
    break;
  }
  s = T();
  s.answer();
}

main() {
  test1();
  test2();
  test3();
  test4();
}
