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
/// @description Checks that if a type `T` is made a type of interest in `S1` or
/// `S2` then some variable can be promoted to `T` in appropriate `S1` or `S2`
/// and `after(N)`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  if (2 > 1) {
    s is T ? 1 : 2;
    s = T();
    s.answer();
  } else {
  }
}

test2() {
  S s = S();
  if (1 > 2) {
  } else {
    s is T ? 1 : 2;
    s = T();
    s.answer();
  }
}

test3() {
  S s = S();
  if (2 > 1) {
    s is T ? 1 : 2;
  } else {
  }
  s = T();
  s.answer();
}

test4() {
  S s = S();
  if (1 > 2) {
  } else {
    s is T ? 1 : 2;
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
