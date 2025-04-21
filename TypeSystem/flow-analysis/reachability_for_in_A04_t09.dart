// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion for each statement: If `N` is a for statement of the form
/// `for (T X in E) S`, `for (var X in E) S`, or `for (X in E) S`, then:
/// - Let `before(E) = before(N)`
/// - Let `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`
/// - Let `after(N) = join(before(S), break(S))`
///
/// @description Checks that if a type `T` is made a type of interest in `S`
/// then some variable can be promoted to `T` in `S` and `after(N)`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  for (var j in []) {
    s is T ? 1 : 2; // Make `T` a type of interest
    s = T();
    s.answer();
  }
}

test2() {
  S s = S();
  [
    for (var j in [])
      [s is T ? 1 : 2, s = T(), s.answer()]
  ];
}

test3() {
  S s = S();
  <Object>{
    for (var j in [])
      [s is T ? 1 : 2, s = T(), s.answer()]
  };
}

test4() {
  S s = S();
  <int, List<Object>>{
    for (var j in [])
      s is T ? 1 : 2 : [s = T(), s.answer()]
  };
}

test5() {
  S s = S();
  for (var j in []) {
    s is T ? 1 : 2;
  }
  s = T();
  s.answer();
}

test6() {
  S s = S();
  [
    for (var j in [])
      s is T ? 1 : 2,
    s = T(),
    s.answer()
  ];
}

test7() {
  S s = S();
  <Object>{
    for (var j in [])
      s is T ? 1 : 2,
    s = T(),
    s.answer()
  };
}

test8() {
  S s = S();
  <Object, Object>{
    for (var j in [])
      s is T ? 1 : 2 : 0,
    s = T(): s.answer()
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
}
