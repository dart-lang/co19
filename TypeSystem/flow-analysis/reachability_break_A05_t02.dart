// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Break statement: If `N` is a statement of the form `break [L];`,
/// then:
/// - Let `S` be the statement targeted by the `break`. If `L` is not present,
///   this is the innermost `do`, `for`, `switch`, or `while` statement.
///   Otherwise it is the `do`, `for`, `switch`, or `while` statement with a
///   label matching L.
/// - Update `break(S) = join(break(S), before(N))`.
/// - Let `after(N) = unreachable(before(N))`.
///
/// @description Checks that if some type `T` is made a type of interest
/// `before(N)` then the variable can be promoted to `T` in `after(N)`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  L:
  for (int j = 0; j < 1; j++) {
    for (int j = 0; j < 1; j++) {
      if (s is T) {} // Make `T` a type of interest
      break L;
      // Unreachable, but does support promotion.
      s = T();
      s.answer();
    }
  }
}

test2() {
  S s = S();
  L:
  for (var i in []) {
    for (var j in []) {
      if (s is T) {}
      break L;
      s = T();
      s.answer();
    }
  }
}

test3() {
  S s = S();
  L:
  do {
    do {
      if (s is T) {}
      break L;
      s = T();
      s.answer();
    } while (1 > 2);
  } while (1 > 2);
}

test4() {
  S s = S();
  int i = 0;
  L:
  while (i < 1) {
    while (i < 1) {
      i++;
      if (s is T) {}
      break L;
      s = T();
      s.answer();
    }
  }
}

test5() {
  S s = S();
  L:
  for (;;) {
    switch (42) {
      case 1:
        break;
      case 42:
        if (s is T) {}
        break L;
        s = T();
        s.answer();
    }
  }
}

main() {
  test1();
  test2();
  test3();
  test4();
  test5();
}
