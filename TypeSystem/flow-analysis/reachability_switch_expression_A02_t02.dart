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
/// TODO (sgrekhov): there is no switch expressions in the flow analysis spec
/// yet (April 2025). Update the assertion after spec update.
///
/// @description Checks that `before(S) = after(E)`. Test that if a variable was
/// assigned in `N` then it is definitely unassigned in all others `S`.
/// @author sgrekhov22@gmail.com

void test1() {
  late int i;
  var x = switch (42) {
    1 => i = 42,
    2 => i, // Definitely unassigned
//       ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => i
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

void test2() {
  late int i;
  var x = switch (42) {
    1 => i,
//       ^
// [analyzer] unspecified
// [cfe] unspecified
    2 => i,
//       ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => i = 42
  };
}

main() {
  print(test1);
  print(test2);
}
