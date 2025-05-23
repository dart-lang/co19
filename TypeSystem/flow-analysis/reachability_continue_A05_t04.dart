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
/// @description Checks that if some type `T` is made a type of interest
/// `after(N)` then the variable cannot be promoted to `T` in `before(N)`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  L:
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 2; j++) {
      s = T();
      s.answer();
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      continue L;
      if (s is T) {} // Make `T` a type of interest
    }
  }
}

test2() {
  S s = S();
  L:
  for (var i in []) {
    for (var j in []) {
      s = T();
      s.answer();
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      continue L;
      if (s is T) {}
    }
  }
}

test3() {
  S s = S();
  L:
  do{
    do {
      s = T();
      s.answer();
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      continue L;
      if (s is T) {}
    } while (1 > 2);
  } while (1 > 2);
}

test4() {
  S s = S();
  int i = 0;
  L:
  while (i < 2) {
    while (i < 2) {
      i++;
      s = T();
      s.answer();
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      continue L;
      if (s is T) {}
    }
  }
}

test5() {
  S s = S();
  switch (42) {
    L: case 1:
      break;
    case 42:
      s = T();
      s.answer();
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      continue L;
      if (s is T) {}
  }
}


main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
  print(test5);
}
