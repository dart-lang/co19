// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion switch statement: If `N` is a switch statement of the form
/// `switch (E) {alternatives}` then:
/// - Let `before(E) = before(N)`.
/// - For each `C` in `alternatives` with statement body `S`:
///   - If `C` is labelled let
///     `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`
///     otherwise let `before(S) = after(E)`.
///  - If the cases are exhaustive, then let `after(N) = break(N)` otherwise let
///    `after(N) = join(after(E), break(N))`.
///
/// @description Checks that if `C` is not labelled then `before(S) = after(E)`.
/// Test that if `C` is not labeled and a promoted variable was captured in `E`
/// then it is demoted in `S`.
/// @author sgrekhov22@gmail.com

void test(int? n) {
  if (n != null) {  // n promoted to int
    switch ((){n = 42;}) { // n demoted to int?
      case 1: // ignore: constant_pattern_never_matches_value_type
        n.isEven;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
  }
}

main() {
  print(test);
}
