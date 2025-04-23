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
/// @description Checks that if a type `T` is made a type of interest in
/// `before(N)` then the variable can be promoted to `T` in `D`, `C`, `U`, `S`
/// and `after(N)`. Test a set literal.
/// @note For now (April, 2025) the flow-analysis feature specification does not
/// specify the analysis of for elements, but we extrapolate from the treatment
/// of for statements.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  if (s is T) {} // Make `T` a type of interest
  <int>{
    for ([s = T(), s.answer()]; 1 > 2;)
      0
  };
}

test2() {
  S s = S();
  if (s is T) {}
  <int>{
    for (; [s = T(), s.answer()] == [];) 0
  };
}

test3() {
  S s = S();
  if (s is T) {}
  <int>{
    for (var i = 0; i < 0; s = T(), s.answer()) 0
  };
}

test4() {
  S s = S();
  if (s is T) {}
  <List<Object>>{
    for (; 1 > 2;) [s = T(), s.answer()]
  };
}

test5() {
  S s = S();
  if (s is T) {}
  <int>{
    for (; 1 > 2;) 0
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
}
