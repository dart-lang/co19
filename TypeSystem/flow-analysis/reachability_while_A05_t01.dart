// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion while statement: If `N` is a while statement of the form
/// `while (E) S` then:
/// - Let `before(E) = conservativeJoin(before(N), assignedIn(N), capturedIn(N))`
/// - Let `before(S) = split(true(E))`.
/// - Let `after(N) = inheritTested(join(false(E), unsplit(break(S))), after(S))`
///
/// @description Checks that if a type `T` is made a type of interest in
/// `before(N)` then it can be promoted in `E`, `S` and `after(N)`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  if (s is T) {} // make `T` a type of interest
  while ([s = T(), s.answer()] == []) {}
}

test2() {
  S s = S();
  if (s is T) {}
  while (1 > 2) {
    s = T(); // No error
    s.answer();
  }
}

test3() {
  S s = S();
  if (s is T) {} // Make T a type of interest
  while (1 > 2) {
  }
  s = T();
  s.answer();
}

main() {
  test1();
  test2();
  test3();
}
