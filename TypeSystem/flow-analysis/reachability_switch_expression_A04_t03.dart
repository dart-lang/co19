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
/// @description Checks that if a type `T` is made a type of interest in
/// `alternatives` then it cannot be promoted in other `alternatives`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  var x = switch (42) {
    1 => [s = T(), s.answer()],
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ =>  [s is T ? 1: 2] // Make `T` a type of interest
  };
}

test2() {
  S s = S();
  var x = switch (42) {
    1 =>  [s is T ? 1: 2], // Make `T` a type of interest
    _ => [s = T(), s.answer()],
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

main() {
  print(test1);
  print(test2);
}
