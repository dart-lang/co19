// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Conditional statement: If `N` is a conditional statement of the
/// form `if (E) S1 else S2` then:
/// - Let `before(E) = before(N)`.
/// - Let `before(S1) = split(true(E))`.
/// - Let `before(S2) = split(false(E))`.
/// - Let `after(N) = merge(after(S1), after(S2))`.
///
/// @description Checks that if a type `T` is made a type of interest
/// `before(N)` then the variable can be promoted to `T` in `E`, `S1`, `S2` and
/// `after(N)`.
/// @note For now (April, 2025) the flow-analysis feature specification does not
/// specify the analysis of if elements, but we extrapolate from the treatment
/// of if statements.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  s is T ? 1 : 2; // Make `T` a type of interest
  if ([s = T(), s.answer()] == []) {}
}

test2() {
  S s = S();
  s is T ? 1 : 2;
  [
    if ([s = T(), s.answer()] == []) 0,
  ];
}

test3() {
  S s = S();
  s is T ? 1 : 2;
  <int>{
    if ([s = T(), s.answer()] == []) 0,
  };
}

test4() {
  S s = S();
  s is T ? 1 : 2;
  <int, int>{
    if ([s = T(), s.answer()] == []) 0: 0,
  };
}

test5() {
  S s = S();
  s is T ? 1 : 2;
  if (2 > 1) {
    s = T();
    s.answer();
  } else {}
}

test6() {
  S s = S();
  s is T ? 1 : 2;
  [
    if (2 > 1) ...[s = T(), s.answer()] else 2,
  ];
}

test7() {
  S s = S();
  s is T ? 1 : 2;
  <Object>{
    if (2 > 1) ...[s = T(), s.answer()] else 2,
  };
}

test8() {
  S s = S();
  s is T ? 1 : 2;
  <Object, Object>{if (2 > 1) s = T(): s.answer() else 2: 2};
}

test9() {
  S s = S();
  s is T ? 1 : 2;
  if (1 > 2) {
  } else {
    s = T();
    s.answer();
  }
}

test10() {
  S s = S();
  s is T ? 1 : 2;
  [
    if (1 > 2) 0 else ...[s = T(), s.answer()],
  ];
}

test11() {
  S s = S();
  s is T ? 1 : 2;
  <Object>{
    if (1 > 2) 0 else ...[s = T(), s.answer()],
  };
}

test12() {
  S s = S();
  s is T ? 1 : 2;
  <Object, Object>{if (1 > 2) 0: 0 else s = T(): s.answer()};
}

test13() {
  S s = S();
  s is T ? 1 : 2;
  if (1 > 2) {
  } else {}
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
  test9();
  test10();
  test11();
  test12();
  test13();
}
