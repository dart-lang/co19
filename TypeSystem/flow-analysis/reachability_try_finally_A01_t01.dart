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
/// @description Checks that `before(B1) = split(before(N))`. Test that if a
/// variable is assigned in `B2` only then it is definitely unassigned in `B1`
/// @author sgrekhov22@gmail.com

main() {
  late int i;
  try {
    i; // Definitely unassigned
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  } finally {
    i = 42;
  }
}
