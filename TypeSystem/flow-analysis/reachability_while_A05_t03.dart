// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion while statement: If `N` is a while statement of the form
/// `while (E) S` then:
/// - Let `before(E) = conservativeJoin(before(N), assignedIn(N), capturedIn(N))`
/// - Let `before(S) = split(true(E))`.
/// - Let `after(N) = inheritTested(join(false(E), unsplit(break(S))), after(S))`
///
/// @description Checks that if a type `T` is made a type of interest in `S`
/// then it cannot be promoted in `E`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}


main() {
  S s = S();
  while ([s = T(), s.answer()] == []) {
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    if (s is T) {} // make `T` a type of interest
  }
}
