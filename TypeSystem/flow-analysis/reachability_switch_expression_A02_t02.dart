// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion switch expression: If `N` is a switch expression of the form
/// `switch (E) {alternatives}` then:
/// - Let `before(E) = split(before(N))`.
/// - For each case `Cj` in `alternatives` with expression `Ej`, for `j` in
///   `1 .. k`:
///   - Let `before(Ej) = after(E)`.
/// - Let `after(N) = join(after(E1), after(E2), .. after(Ek))`.
/// TODO (sgrekhov): there is no switch expression in the flow analysis spec yet
/// (April 2025). Update the assertion after spec update.
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
