// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion do while statement: If `N` is a do while statement of the form
/// `do S while (E)` then:
/// - Let `before(S) = conservativeJoin(before(N), assignedIn(N), capturedIn(N))`.
/// - Let `before(E) = join(after(S), continue(N))`
/// - Let `after(N) = join(false(E), break(S))`
///
/// @description Checks that if a type `T` is made a type of interest in `E`
/// then the variable cannot be promoted to `T` in `S`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

main() {
  S s = S();
  do {
    s = T();
    s.answer();
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  } while ([s is T ? 1: 2] == []);
}
