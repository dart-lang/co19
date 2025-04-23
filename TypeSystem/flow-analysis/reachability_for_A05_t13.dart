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
/// then the variable cannot be promoted to `T` in `D` and `C`.
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
  for ([s = T(), s.answer()];;) {
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    if (s is T) {} // Make `T` a type of interest
  }
}

test2() {
  S s = S();
  [
    for ([s = T(), s.answer()];;)
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    s is T ? 1 : 2
  ];
}

test3() {
  S s = S();
  <Object>{
    for ([s = T(), s.answer()];;)
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      s is T ? 1 : 2
  };
}

test4() {
  S s = S();
  <int, int>{
    for ([s = T(), s.answer()];;)
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      s is T ? 1 : 2: 0
  };
}

test5() {
  S s = S();
  for (; [s = T(), s.answer()] == [];) {
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    if (s is T) {} // Make `T` a type of interest
  }
}

test6() {
  S s = S();
  [
    for (; [s = T(), s.answer()] == [];)
//                     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      s is T ? 1 : 2
  ];
}

test7() {
  S s = S();
  <int>{
    for (; [s = T(), s.answer()] == [];)
//                     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      s is T ? 1 : 2
  };
}

test8() {
  S s = S();
  <int, int>{
    for (; [s = T(), s.answer()] == [];)
//                     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      s is T ? 1 : 2 : 0
  };
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
  print(test5);
  print(test6);
  print(test7);
  print(test8);
}
