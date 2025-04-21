// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Continue statement: If `N` is a statement of the form
/// `continue [L];` then:
/// - Let `S` be the statement targeted by the continue. If `L` is not present,
///   this is the innermost `do`, `for`, or `while` statement. Otherwise it is
///   the `do`, `for`, or `while` statement with a label matching `L`, or the
///   `switch` statement containing a switch case with a label matching `L`.
/// - Update `continue(S) = join(continue(S), before(N))`.
/// - Let `after(N) = unreachable(before(N))`.
///
/// @description Checks that is some type `T` is made a type of interest
/// `before(N)` then some variable can be promoted to `T` in `after(N)`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  for (int j = 0; j < 1; j++) {
    if (s is T) {} // Make `T` a type of interest
    continue;
    s = T();
    s.answer();
  }
}

test2() {
  S s = S();
  for (var j in []) {
    if (s is T) {}
    continue;
    s = T();
    s.answer();
  }
}

test3() {
  S s = S();
  do {
    if (s is T) {}
    continue;
    s = T();
    s.answer();
  } while (1 > 2);
}

test4() {
  S s = S();
  int i = 0;
  while (i < 1) {
    i++;
    if (s is T) {}
    continue;
    s = T();
    s.answer();
  }
}

main() {
  test1();
  test2();
  test3();
  test4();
}
