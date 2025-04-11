// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion try finally: If `N` is a try/finally statement of the form
/// `try B1 finally B2` then:
/// - Let `before(B1) = split(before(N))`
/// - Let `before(B2) = split(join(drop(after(B1)),
///     conservativeJoin(before(N), assignedIn(B1), capturedIn(B1))))`
/// - Let `after(N) = restrict(after(B1), after(B2), assignedIn(B2))`
///
/// @description Checks that if a type `T` is made a type of interest in `B2`
/// but in dead code then it cannot be promoted `after(N)`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

main() {
  S s = S();
  try {
  } finally {
    if (false) {
      if (s is T) {} // Make `T` a type of interest
    }
  }
  s = T();
  s.answer();
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
