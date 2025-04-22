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
/// `after(N)` then some variable cannot be promoted to `T` in `before(N)`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  for (int j = 0; j < 2; j++) {
    s = T();
    s.answer();
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    continue;
    if (s is T) {} // Make `T` a type of interest
  }
}

test2() {
  S s = S();
  for (var j in []) {
    s = T();
    s.answer();
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    continue;
    if (s is T) {}
  }
}

test3() {
  S s = S();
  do {
    s = T();
    s.answer();
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    continue;
    if (s is T) {}
  } while (1 > 2);
}

test4() {
  S s = S();
  int i = 0;
  while (i < 2) {
    i++;
    s = T();
    s.answer();
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    continue;
    if (s is T) {}
  }
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
}
