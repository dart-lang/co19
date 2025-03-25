// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion for each statement: If `N` is a for statement of the form
/// `for (T X in E) S`, `for (var X in E) S`, or `for (X in E) S`, then:
/// - Let `before(E) = before(N)`
/// - Let `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`
/// - Let `after(N) = join(before(S), break(S))`
///
/// @description Checks that
/// `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`. Test
/// that if a variable is assigned in `S` then it is still definitely unassigned
/// in `E` (`conservativeJoin` starts `after(E)`).
/// @author sgrekhov22@gmail.com

main() {
  late int i;
  for (var j in [42, i]) {
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
    i = 42;
  }
}
