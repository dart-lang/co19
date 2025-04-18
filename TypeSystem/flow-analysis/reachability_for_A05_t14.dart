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
/// @description Checks that if a type `T` is made a type of interest in `C`
/// then some variable cannot be promoted to `T` in `D`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  for ([s = T(), s.answer()]; s is T ? true: false;) {
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

test2() {
  S s = S();
  [
    for ([s = T(), s.answer()]; s is T ? true: false;) 0
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ];
}

test3() {
  S s = S();
  <int>{
    for ([s = T(), s.answer()]; s is T ? true: false;) 0
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

test4() {
  S s = S();
  <int, int>{
    for ([s = T(), s.answer()]; s is T ? true: false;) 0: 0
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
}
