// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion do while statement: If `N` is a do while statement of the form
/// `do S while (E)` then:
/// - Let `before(S) = conservativeJoin(before(N), assignedIn(N), capturedIn(N))`.
/// - Let `before(E) = join(after(S), continue(N))`
/// - Let `after(N) = join(false(E), break(S))`
///
/// @description Checks that if a type `T` is made a type of interest in
/// `before(S)` then the variable can be promoted to `T` in `S`, `E` and
/// `after(N)`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  if (s is T) {} // Make `T` a type of interest
  do {
    s = T();
    s.answer();
  } while (1 > 2);
}

test2() {
  S s = S();
  if (s is T) {}
  do {
  } while ([s = T(), s.answer()] == []);
}

test3() {
  S s = S();
  if (s is T) {}
  do {
  } while (1 > 2);
  s = T();
  s.answer();
}

main() {
  test1();
  test2();
  test3();
}
