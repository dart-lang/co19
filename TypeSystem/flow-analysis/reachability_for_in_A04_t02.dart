// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion for each statement: If `N` is a for statement of the form
/// `for (T X in E) S`, `for (var X in E) S`, or `for (X in E) S`, then:
/// - Let `before(E) = before(N)`
/// - Let `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`
/// - Let `after(N) = join(before(S), break(S))`
///
/// @description Checks that if a type `T` is made a type of interest in
/// `before(N)` then the variable can be promoted to `T` in `X`, `E`, `S` and
/// `after(N)`. Test a list literal.
/// @note For now (April, 2025) the flow-analysis feature specification does not
/// specify the analysis of for-in elements, but we extrapolate from the
/// treatment of for-in statements.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  if (s is T) {} // Make `T` a type of interest
  [
    for (s in <T>[])
      s.answer()
  ];
}

test2() {
  S s = S();
  if (s is T) {}
  [
    for (var j in [s = T(), s.answer()]) 0
  ];
}

test3() {
  S s = S();
  if (s is T) {}
  [
    for (var j in []) [s = T(), s.answer()]
  ];
}

test4() {
  S s = S();
  if (s is T) {}
  [
    for (var j in []) 0,
    s = T(),
    s.answer()
  ];
}

main() {
  test1();
  test2();
  test3();
  test4();
}
